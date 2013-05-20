# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(id: '1', name: 'Admin', email: 'admin@email.com', password: '21232f297a57a5a743894a0e4a801fc3') #change email to yours; initial password in database is MD5('admin')

ArtifactStatus.create(project_id: '1', title: 'Submitted')
ArtifactStatus.create(project_id: '1', title: 'In progress')
ArtifactStatus.create(project_id: '1', title: 'Test/QA')
ArtifactStatus.create(project_id: '1', title: 'Released')
ArtifactStatus.create(project_id: '1', title: 'Approved')
ArtifactStatus.create(project_id: '1', title: 'Cancelled')

ArtifactType.create(project_id: '1', title: 'Stakeholder requirement', shortening: 'STK-RQ')
ArtifactType.create(project_id: '1', title: 'System requirement', shortening: 'SYS-RQ')
ArtifactType.create(project_id: '1', title: 'Architecture', shortening: 'ARCH')
ArtifactType.create(project_id: '1', title: 'Acceptance test', shortening: 'ACC-TST')
ArtifactType.create(project_id: '1', title: 'System test', shortening: 'SYS-TST')
ArtifactType.create(project_id: '1', title: 'Integration test', shortening: 'INT-TST')
ArtifactType.create(project_id: '1', title: 'Reference', shortening: 'REF')

Project.create(id: '1', administrator_id: '1', name: 'Test project', description: '', maximum_history: '10')