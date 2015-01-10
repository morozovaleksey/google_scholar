App.module "Base", (Base, App, Backbone, Marionette, $, _) ->

  class Base.LayoutView extends Marionette.LayoutView

  class Base.ItemView extends Marionette.ItemView

  class Base.CollectionView extends Marionette.CollectionView