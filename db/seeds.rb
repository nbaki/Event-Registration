# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

EventRef.create(year: 2016,
                  event_start: Date.strptime('05/01/16', '%m/%d/%y'),
                  registration_open: Date.strptime('01/16/16', '%m/%d/%y'),
                  max_registrants: 50) unless EventRef.where(year: 2016).exists?