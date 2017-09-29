# _Shoe Store_

#### _Storing data in Join Table 09.29.2017_

#### By _Keegan Ruebling_

## Description

_This app allows the user to create stores and shoes. When a store is added, it populates a table on the index, same with the shoes. When viewing individual stores you can select the shoes you would like to add via checkboxes on that stores page. The user can also edit the store name as well as delete the store. When viewing shoe_information, the user will see a list of all the stores that currently sell that shoe._

## Specs

| name   | Describe                                  | Input                                                     | Output             |
|--------|-------------------------------------------|-----------------------------------------------------------|--------------------|
| .all   | initial array                             | []                                                        | []                 |
| clear  | empties the array                         | [word1, word2]                                            | []                 |
| id     | assigns each word a unique id             | [word1, word2]                                            | [1, 2]             |
| save   | adds variable to array                    | word  = Word.new("Ruby" "programing language")            | [word]             |
| delete | changes exisiting word to empty string    | word = Word.new("Michael") word.delete                    | [""]               |
| sort   | orders list alphabetically by last name   | word = Word.new("Michael" "Keegan") word.sort             | "Keegan" "Michael" |

## Setup/Installation Requirements

1. git clone https://github.com/kruebling/vocab_words.git into local directory
2. ruby app.rb inside directory
3. localhost://4567 in preferred browser

## Known Bugs

_App is currecntly a work in progress_

## Support and contact details

_keegan.ruebling@gmail.com_

### License

MIT License

Copyright (c) 2017 Keegan Ruebling
