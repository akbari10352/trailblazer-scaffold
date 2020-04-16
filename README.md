# trailblazer_scaffold

Trailblazer Scaffold will generate the contracts and operations based on the model and actions.

**First step**

`gem install trailblazer_scaffold`


**Second step**

make sure you have the actions in your related Controller

**Last step**

run `rails g trailblazer_scaffold:generate {class_name}`

*example*
`rails g trailblazer_scaffold:generate Shop::Product`

**Make sure you enter the full class name include the nested class too**
