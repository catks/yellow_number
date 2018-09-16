
# Yellow Number

Yellow Number search's for a contact info (name and telephone number) by address

## Installation

To run you only need to have docker and docker-compose

```bash
git clone https://github.com/catks/yellow_number
cd yellow_number
docker-compose build
```

## Usage

To use creates a `input.txt` file in the project directory, and adds the addresses you want yellow_number to search.

Example of `input.txt` contents:

```
Rua Legal, 123, São Paulo
Rua dos Bobos, 0, Moraes City
```

OBS: Each address must be placed in one line and follow the pattern `street name, number, city`

After that just run the app

```bash
docker-compose run --rm app
```

Yellow number will create a csv file for each address in input.txt and will place it in output folder.

## TODO

 1. Add Search Strategies
 2. Add Integration Tests
 3. Add more output formats
 4. Add a cli interface(to set output and search strategies)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/catks/yellow_number

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
