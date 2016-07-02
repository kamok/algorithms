#component base class
class Task
	attr_reader :name

	def initialize(name)
		@name = name
	end

	def get_time_required
		0.0
	end
end

#leaf classes
class AddDryIngredientsTask < Task
	def initialize 
		super('Add dry ingredients')
	end

	def get_time_required
		1.0                            #1 minute
	end
end

class MixTask < Task
	def initialize
		super('Mix that batter up!')
	end

	def get_time_required
		3.0
	end
end

#composite class
class MakeBatterTask < CompositeTask
	def initialize
		super('Make batter')
		add_sub_task(AddDryIngredientsTask.new)
		add_sub_task(AddLiquidsTask.new)
		add_sub_task(MixTask.new)
	end
end

#composite base class

class CompositeTask < Task
	def initialize(name)
		super(name)
		@sub_tasks = []
	end

	def add_sub_task(sub_task)
		@sub_tasks << sub_task
	end

	def delete_sub_task(sub_task)
		@sub_tasks.delete(sub_task)
	end

	def get_time_required
		time = 0.0
		@sub_tasks.each (|sub_task| time += task.get_time_required)
		time
	end
end