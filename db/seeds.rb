# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(id: '1', name: 'Admin', email: 'admin@email.com', password: '21232f297a57a5a743894a0e4a801fc3') #change admin email to yours

ArtifactStatus.create(title: 'Submitted')
ArtifactStatus.create(title: 'In progress')
ArtifactStatus.create(title: 'Test/QA')
ArtifactStatus.create(title: 'Released')
ArtifactStatus.create(title: 'Approved')
ArtifactStatus.create(title: 'Cancelled')

ArtifactType.create(title: 'Stakeholder requirement', shortening: 'STK-RQ')
ArtifactType.create(title: 'System requirement', shortening: 'SYS-RQ')
ArtifactType.create(title: 'Architecture', shortening: 'ARCH')
ArtifactType.create(title: 'Acceptance test', shortening: 'ACC-TST')
ArtifactType.create(title: 'System test', shortening: 'SYS-TST')
ArtifactType.create(title: 'Integration test', shortening: 'INT-TST')
ArtifactType.create(title: 'Reference', shortening: 'REF')