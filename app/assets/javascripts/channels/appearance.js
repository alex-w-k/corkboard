// App.cable.subscriptions.create("AppearanceChannel", {
//   connected: function() {
//     install();
//     return this.appear();
//   },
//   disconnected: function() {
//     return this.uninstall();
//   },
//   rejected: function() {
//     return this.uninstall();
//   },
//   appear: function() {
//     return this.perform("appear", {
//       appearing_on: $("main").data("appearing-on")
//     });
//   },
//   away: function() {
//     return this.perform("away");
//   },
//   received: function(data) {
//     userId = data.user_id
//     eventType = data.event
//     if(eventType == 'appear') {
//       $('#user_' + userId).addClass('online');
//     } else {
//       $('#user_' + userId).removeClass('online');
//     }
//   }
//
// });
//
// install = function() {
//   // $(document).on("turbolinks:load.", (function() {
//   //   received();
//   // }));
// },
//
// uninstall = function() {
//   $(document).off(".appearance");
//   return $(buttonSelector).hide();
// }
