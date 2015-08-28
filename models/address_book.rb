require_relative "entry.rb"
require "csv"

class AddressBook
  attr_accessor :entries

   def initialize
       @entries = []
   end

   def add_entry(name, phone, email)
       index = 0
       @entries.each do |entry|
         if name < entry.name
           break
         end
         index += 1
       end

       @entries.insert(index, Entry.new(name, phone, email))
   end

   def remove_entry(name, phone, email)
       temp_entry = Entry.new(name, phone, email)
       @entries.delete_if{|entry| entry.is_equal?(temp_entry)}
       # can I compare entry and temp_entry w/o is_equal? method? No, of course not!
       # @entries.delete_if{|entry| entry == temp_entry}
       # can I have multiple conditions inside the block? yes, of course!
       # @entries.delete_if{|entry| entry.name == name && entry.phone_number == phone && entry.email == email}
   end

   def import_from_csv(file_name)
       csv_text = File.read(file_name)
       csv = CSV.parse(csv_text, headers: true, skip_blanks: true)

       csv.each do |row|
           row_hash = row.to_hash
           add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
       end
   end

end
