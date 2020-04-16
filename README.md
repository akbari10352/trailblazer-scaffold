# trailblazer_scaffold

Trailblazer Scaffold will generate the contracts and operations based on the model and base actions(*create* *update* *destroy*).

**First step**

`gem install trailblazer_scaffold`


**Second step**

make sure you have the actions in your related Controller

**Last step**

run `rails g trailblazer_scaffold:generate {class_name}`

*example :*
 `rails g trailblazer_scaffold:generate Shop::Product`

Make sure that you enter the full class name include the parent classes, for `models/shop/product.rb` use `Shop::Product`