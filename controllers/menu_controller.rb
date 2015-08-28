require_relative "../models/address_book.rb"

class MenuController
   attr_accessor :address_book

   def initialize
     @address_book = AddressBook.new
   end

   def main_menu
     puts "Main Menu - #{@address_book.entries.count} entries"
     puts "1 - View all entries"
     puts "2 - Create an entry"
     puts "3 - Search for an entry"
     puts "4 - Import entries from a CSV"
     puts "5 - View by entry number"
     puts "6 - Exit"
     print "Enter your selection: "

     selection = gets.to_i
     case selection
       when 1
         system "clear"
         view_all_entries
         main_menu
       when 2
         system "clear"
         create_entry
         main_menu
       when 3
         system "clear"
         search_entries
         main_menu
       when 4
         system "clear"
         read_csv
         main_menu
       when 5
         system "clear"
         entry_by_number
         main_menu
       when 6
         puts "Good-bye!"
         exit(0)
     else
       system "clear"
       puts "Sorry, that is not a valid input"
       main_menu
     end
   end

   def view_all_entries
     @address_book.entries.each do |entry|
       system "clear"
       puts entry.to_s
       entry_submenu(entry)
     end

     system "clear"
     puts "End of entries"
   end

   def create_entry
     system "clear"
     puts "New AddressBloc Entry"
     print "Name: "
     name = gets.chomp
     print "Phone number: "
     phone = gets.chomp
     print "Email: "
     email = gets.chomp

     @address_book.add_entry(name, phone, email)

     system "clear"
     puts "New entry created"
   end

   def search_entries
   end

   def read_csv
   end

   def entry_by_number
     print "Enter the entry number: "
     # because using to_i, no need to use chomp
     index = gets.to_i
     # while with two cinditions didn't work!
     until index.between?(1,@address_book.entries.size) do
       puts "Out of bound index!"
       print "Please enter between #{1} and #{@address_book.entries.size}: "
       index = gets.to_i
     end
     entry = @address_book.entries[index-1]
     puts entry.to_s
     # Alternative solution:
     # index = gets.to_i
     # if index < 1
     #  puts @address_book.entries[selection - 1]
     #  prints "press enter to return to main menu"
     #  gets.chomp
     #  system "clear"
     # else
     #  puts #{index} is not a valid input"
     #  entry_by_number
     # end
   end

   def entry_submenu(entry)
     puts "n - next entry"
     puts "d - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"

     selection = gets.chomp
     case selection
       when "n"
       when "d"
       when "e"
       when "m"
         system "clear"
         main_menu
     else
       system "clear"
       puts "#{selection} is not a valid input"
       entries_submenu(entry)
     end
   end

 end
