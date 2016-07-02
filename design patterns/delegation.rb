class Formatter
	def output_report( context )
		raise 'Abstract method output_report called.'
	end
end

class HTMLFormatter < Formatter
	def output_report(context)
		puts('<html>')
		puts(' <head>')
		puts(" <title>#{context.title}</title>")
		puts(' </head>')
		puts(' <body>')
		context.text.each do |line|
			puts(" <p>#{line}</p>" )
		end
		puts(' </body>')
		puts('</html>')
	end 
end

class PlainTextFormatter < Formatter
	def output_report(formatter)
		puts("***** #{formatter.title} *****")
		formatter.text.each do |line|
			puts(line)
		end
	end
end

class Report
	attr_reader :title, :text
	attr_accessor :formatter

	def initialize(formatter)
		@title = 'Monthly Report'
		@text = ["Things are going", "really well."]
		@formatter = formatter
	end

	def output_report
		@formatter.output_report(self)
	end
end

report = Report.new(PlainTextFormatter.new)
report.output_report

report.formatter = HTMLFormatter.new
report.output_report