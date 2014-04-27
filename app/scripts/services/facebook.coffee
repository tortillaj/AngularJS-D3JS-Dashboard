'use strict'

angular.module('votifiAngularApp')
  .factory 'Facebook', ['$q', '$http', 'Globals', 'Account', 'Page', 'ezfb', ($q, $http, Globals, Account, Page, ezfb) ->

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

  ]
