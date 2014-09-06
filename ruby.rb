require 'csv'

#parse data.csv
students = []
heading = []
firsttime = true
CSV.foreach("./data.csv", col_sep: ",") { |row|
	if firsttime
		firsttime = false
		heading[0] = row[0]
		heading[1] = row[1]
		heading[2] = row[2]
	else
		name = row[0]
		score = row[1]
		color = row[2]
		students << {:name => name, :score =>score, :color => color}
	end
	
}

#find max and min score
max = students.max_by{ |student| student[:score]}[:name]
puts "Student with highest score: " + max
min = students.min_by{ |student| student[:score]}[:name]
puts "Student with lowest score: " + min

#find mean
sum=0
students.each {|student| sum += student[:score].to_f}
mean = sum/students.length
puts "Mean of all student’s scores: " + mean.to_s

#find most and least popolar color
color_count = {}
students.each {|student| 
	color = student[:color]
	if color_count[color] == nil
		color_count[color] = 0
	end
	color_count[color] += 1
}
print "The most popular color: " 
max_number = color_count.values.max 
color_count.each{ |k, v|
	if max_number == v
		print k + " "
	end
}
puts ""

print "The least popular color: " 
min_number = color_count.values.min 
color_count.each{ |k, v|
	if min_number == v
		print k + " "
	end
	
}
puts ""

#do the capitalize thing
students.each { |student|
	last_name = ""
	first_name = ""
	split_full_name = student[:name].split(" ")
	last_name = split_full_name[0]
	for index in 1..split_full_name.length-1
		first_name << split_full_name[index] + " "

	end
	cap_first_name = first_name[0].downcase + first_name[1..-3] + first_name[-2].upcase
	cap_last_name = last_name[0].downcase + last_name[1..-2] + last_name[-1].upcase
	puts cap_last_name +" " +cap_first_name

}





