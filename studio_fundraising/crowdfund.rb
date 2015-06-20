require_relative 'fundrequest'

project1 = Project.new("LMN", 500, 3000)
project2 = Project.new("XYZ", 25, 75)
projects = FundRequest.new("VC-Friendly Start-up Projects")
projects.add_project(project1)
projects.add_project(project2)
projects.request_funding
