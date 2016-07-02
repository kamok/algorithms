module Subject
	def initialize
		@observers = []
	end

	def add_observer(observer)
		@observers << observer
	end

	def delete_observer(observer)
		@observers.delete(observer)
	end

	def notify_observers
		@observers.each do |observer|
			observer.update(self)
		end
	end
end

class Employee
	include Subject
	attr_reader :name
	attr_accessor :title, :salary

	def initialize (name, title, salary)
		super()
		@name = name
		@title = title
		@salary = salary
	end

	def salary= (new_salary)
		@salary = new_salary
		notify_observers
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