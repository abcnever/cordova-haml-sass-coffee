define (require) ->

  $ = require("jquery")
  Backbone = require("backbone")
  PageSlider = require("app/utils/pageslider")
  HomeView = require("app/views/Home")
  slider = new PageSlider($("body"))
  homeView = new HomeView()
  Backbone.Router.extend
    routes:
      "": "home"
      "employees/:id": "employeeDetails"
      "employees/:id/reports": "reports"

    home: ->
      homeView.delegateEvents()
      slider.slidePage homeView.$el
      return

    employeeDetails: (id) ->
      require [
        "app/models/employee"
        "app/views/Employee"
      ], (models, EmployeeView) ->
        employee = new models.Employee(id: id)
        employee.fetch success: (data) ->
          slider.slidePage new EmployeeView(model: data).$el
          return

        return

      return

    reports: (id) ->
      require [
        "app/models/employee"
        "app/views/Reports"
      ], (models, ReportsView) ->
        employee = new models.Employee(id: id)
        employee.fetch success: (data) ->
          slider.slidePage new ReportsView(model: data).$el
          return

        return

      return

