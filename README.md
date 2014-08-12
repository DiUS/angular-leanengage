angular-leanengage
==================

LeanEngage integration for your AngularJS app

Install
-------

```
bower install angular-leanengage
```

Usage
-----

Make sure you include the module in your application config

```
angular.module('myApp', [
  'leanEngage',
  ...
]);
```

Config
-----

```js
angular.module('myApp').config(function(LeanEngageProvider) {
  LeanEngageProvider.setAppId('XXXX');
})
```

Start
----

After authentication, start tracking your customer:


```js
  LeanEngage.start({
    user_id: user.id,
    name: user.username,
    email: user.email,
    custom_data: {
      subscription: user.subscription
    }
  });
```

Controller
----

```js
angular.module('myApp').controller('MyController', function (LeanEngage) {
    LeanEngage.trackEvent('products', 'view');
});
```
