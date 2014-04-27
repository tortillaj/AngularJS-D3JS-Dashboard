'use strict'

angular.module('votifiAngularApp')
  .factory 'Facebook', ['$q', '$http', 'Globals', 'Account', 'Page', 'ezfb', ($q, $http, Globals, Account, Page, ezfb) ->

    getLoginSatus: () ->
      $q.all([
        ezfb.getLoginStatus()
      ]).then (authStatus) ->
        if (authStatus[0].status is 'connected')
          $q.all([
            ezfb.api('/me', { access_token: authStatus[0].authResponse.accessToken })
          ]).then (me) ->
            authStatus[1] = me
            return authStatus

    postLink: (link, pages) ->
      page = Page.findPage(link.fbPageId, pages)
      page = page[0]

      angular.extend(link,
        link: page.fbPage.link + '/app_' + Globals.fbAppId + '?app_data=pollId|' + link.qid
        app_id: Globals.fbAppId
        access_token: page.fbPageAccessToken
        actions: [{ name: 'More Polls', link: page.fbPage.link }]
      )

      $q.all([
        ezfb.api('/' + page.fbPageId + '/feed', 'post', link)
      ]).then (res) ->
        return res[0]

    createTab: (app, pages, loginStatus) ->

      page = pages.filter (page) ->
        page.id is app.appId
      page = page[0]

      $q.all([
        ezfb.api('/' + page.id + '/tabs', 'post', { app_id: Globals.fbAppId, access_token: page.access_token })
      ]).then (res) ->
        res[1] =
          poll_id: app.pollId
          fb_user_access_token: loginStatus.authResponse.accessToken
          fb_page_id: page.id
          fb_user_id: loginStatus.authResponse.userId
        return res

    fetchPages: (loginStatus) ->
      $q.all([
        ezfb.api('/me/accounts', { access_token: loginStatus.authResponse.accessToken })
      ]).then (res) ->
        return res[0]

  ]
