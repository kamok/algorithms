# module Subject
# 	def initialize
# 		@observers = []
# 	end

# 	def add_observer(observer)
# 		@observers << observer
# 	end

# 	def delete_observer(observer)
# 		@observers.delete(observer)
# 	end

# 	def notify_observers
# 		@observers.each do |observer|
# 			observer.update(self)
# 		end
# 	end
# end

require 'observer'

class Employee
	include Observable
	attr_reader :name
	attr_accessor :title, :salary

	def initialize (name, title, salary)
		super()
		@name = name
		@title = title
		@salary = salary
	end

	def salary= (new_salary)
		old_salary = @salary
		@salary = new_salary
		if old_salary != new_salary
			changed
			notify_observers(self)
		end
	end

	def title= (new_title)
		old_title = @title
		@title = new_title
		if old_title != new_title
			changed
			notify_observers(self)
		end
	end
end

class Payroll
	def update (changed_employee)
		puts "Cut a new check for #{changed_employee.name}!"
		puts "His salary is now #{changed_employee.salary}!"
	end
end

class Taxman
	def update (changed_employee)
		puts "Send #{changed_employee.name} a new tax bill."
	end
end

tax_man = Taxman.new
payroll = Payroll.new
ka = Employee.new("Ka", "Code_Newb", "65,000")

ka.add_observer(payroll)
ka.add_observer(tax_man)

ka.salary="50,000"

##Is this obsolete with before and after filters?

class EmployeeObserver < ActiveRecord::Observer
	def after_create(employee)
		# New employee record created
	end
	def after_update(employee)
		# Employee record updated
	end
	def after_destroy(employee)
		# Employee record deleted
	end
end