# AngularJS Dashboard with D3JS
This is a simple implementation of D3JS in an Angular app. It's not meant to be a finished product, but just an example of how you might integrate the two.

The data is just made up, meant to model traffic to an app or website. 

## Usage
This project is scaffolded from Yeoman using generator-angular, so any standard grunt commands are available.

```
npm install && bower install
grunt serve
```

## Notes

### Data
All the data is provided as flat JSON files, so you can see how you might query an actual API. A finished app would probably not use a JSON file to serve data! On the other hand, all the models in Angular return promise objects, which is how I'd normally return data.

### Styles
The basic styles are provided by Twitter Bootstrap. Since this project isn't really concerned with styles, I didn't spend a great deal of time on that. However, any custom styles written are in atomic design layout with BEM naming system.

### Facebook Integration
I'd planned to do a more thorough Facebook integration, but ultimately moved on to other work. You can probably just ignore anything FB related. The plan was to allow sharing of links to a FB wall.

## Sources
This project makes use of several other projects, notably
1. AngularJS & D3JS (of course!)
2. [Angular UI Bootstrap directives](https://github.com/angular-ui/bootstrap)
3. [AngularJS NVD3 directives](https://github.com/cmaurer/angularjs-nvd3-directives)
4. [Angular EasyFB](https://github.com/pc035860/angular-easyfb)
