# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting model 'RequirementContent'
        db.delete_table('track_requirementcontent')

        # Adding model 'RequirementType'
        db.create_table('track_requirementtype', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['RequirementType'])

        # Deleting field 'RequirementStatus.content'
        db.delete_column('track_requirementstatus', 'content_id')

        # Adding field 'RequirementStatus.type'
        db.add_column('track_requirementstatus', 'type',
                      self.gf('django.db.models.fields.related.ForeignKey')(default=0, to=orm['track.RequirementType']),
                      keep_default=False)

        # Deleting field 'RequirementOwner.content'
        db.delete_column('track_requirementowner', 'content_id')

        # Adding field 'RequirementOwner.type'
        db.add_column('track_requirementowner', 'type',
                      self.gf('django.db.models.fields.related.ForeignKey')(default=0, to=orm['track.RequirementType']),
                      keep_default=False)

        # Deleting field 'Requirement.content'
        db.delete_column('track_requirement', 'content_id')

        # Adding field 'Requirement.type'
        db.add_column('track_requirement', 'type',
                      self.gf('django.db.models.fields.related.ForeignKey')(default=0, to=orm['track.RequirementType']),
                      keep_default=False)


    def backwards(self, orm):
        # Adding model 'RequirementContent'
        db.create_table('track_requirementcontent', (
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150, unique=True)),
        ))
        db.send_create_signal('track', ['RequirementContent'])

        # Deleting model 'RequirementType'
        db.delete_table('track_requirementtype')

        # Adding field 'RequirementStatus.content'
        db.add_column('track_requirementstatus', 'content',
                      self.gf('django.db.models.fields.related.ForeignKey')(default=0, to=orm['track.RequirementContent']),
                      keep_default=False)

        # Deleting field 'RequirementStatus.type'
        db.delete_column('track_requirementstatus', 'type_id')

        # Adding field 'RequirementOwner.content'
        db.add_column('track_requirementowner', 'content',
                      self.gf('django.db.models.fields.related.ForeignKey')(default=0, to=orm['track.RequirementContent']),
                      keep_default=False)

        # Deleting field 'RequirementOwner.type'
        db.delete_column('track_requirementowner', 'type_id')

        # Adding field 'Requirement.content'
        db.add_column('track_requirement', 'content',
                      self.gf('django.db.models.fields.related.ForeignKey')(default=0, to=orm['track.RequirementContent']),
                      keep_default=False)

        # Deleting field 'Requirement.type'
        db.delete_column('track_requirement', 'type_id')


    models = {
        'auth.group': {
            'Meta': {'object_name': 'Group'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        'auth.permission': {
            'Meta': {'ordering': "('content_type__app_label', 'content_type__model', 'codename')", 'unique_together': "(('content_type', 'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Group']", 'symmetrical': 'False', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'track.department': {
            'Meta': {'object_name': 'Department'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'})
        },
        'track.impact': {
            'Meta': {'ordering': "['order']", 'object_name': 'Impact'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.issue': {
            'Meta': {'object_name': 'Issue'},
            'description': ('django.db.models.fields.CharField', [], {'max_length': '1024'}),
            'dur_date': ('django.db.models.fields.DateTimeField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'impact': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Impact']"}),
            'priority': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Priority']"}),
            'reporter': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"}),
            'start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'status': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.IssueStatus']"})
        },
        'track.issuestatus': {
            'Meta': {'ordering': "['order']", 'object_name': 'IssueStatus'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.member': {
            'Meta': {'object_name': 'Member'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '512'}),
            'project': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Project']"}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.MemberType']"})
        },
        'track.membertype': {
            'Meta': {'ordering': "['order']", 'object_name': 'MemberType'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.phase': {
            'Meta': {'ordering': "['order']", 'object_name': 'Phase'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.priority': {
            'Meta': {'ordering': "['order']", 'object_name': 'Priority'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.probability': {
            'Meta': {'ordering': "['order']", 'object_name': 'Probability'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.product': {
            'Meta': {'object_name': 'Product'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'})
        },
        'track.project': {
            'Meta': {'object_name': 'Project'},
            'description': ('django.db.models.fields.CharField', [], {'max_length': '1024', 'null': 'True', 'blank': 'True'}),
            'end_date': ('django.db.models.fields.DateTimeField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'owner': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.ProjectOwner']"}),
            'product': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Product']"}),
            'project_manager': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"}),
            'requirement': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Requirement']"}),
            'start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'status': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.ProjectStatus']"}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.ProjectType']"}),
            'update': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'auto_now_add': 'True', 'blank': 'True'}),
            'version': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Version']"})
        },
        'track.projecthistory': {
            'Meta': {'object_name': 'ProjectHistory'},
            'editor': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"}),
            'end_date': ('django.db.models.fields.DateTimeField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'project': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Project']"}),
            'start_date': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.ProjectType']"})
        },
        'track.projectowner': {
            'Meta': {'ordering': "['order']", 'object_name': 'ProjectOwner'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.projectstatus': {
            'Meta': {'ordering': "['order']", 'object_name': 'ProjectStatus'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.projecttype': {
            'Meta': {'ordering': "['order']", 'object_name': 'ProjectType'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.requirement': {
            'Meta': {'object_name': 'Requirement'},
            'author': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'owner': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.RequirementOwner']"}),
            'product': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Product']", 'null': 'True', 'blank': 'True'}),
            'requirement': ('django.db.models.fields.related.ManyToManyField', [], {'blank': 'True', 'related_name': "'requirement_requirement'", 'null': 'True', 'symmetrical': 'False', 'to': "orm['track.Requirement']"}),
            'start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'status': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.RequirementStatus']"}),
            'target_date': ('django.db.models.fields.DateTimeField', [], {}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.RequirementType']"}),
            'update': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'auto_now_add': 'True', 'blank': 'True'}),
            'version': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Version']", 'null': 'True', 'blank': 'True'})
        },
        'track.requirementhistory': {
            'Meta': {'object_name': 'RequirementHistory'},
            'editor': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"}),
            'end_date': ('django.db.models.fields.DateTimeField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'owner': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.RequirementOwner']"}),
            'requirement': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Requirement']"}),
            'start_date': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'})
        },
        'track.requirementowner': {
            'Meta': {'ordering': "['order']", 'object_name': 'RequirementOwner'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.RequirementType']"})
        },
        'track.requirementstatus': {
            'Meta': {'ordering': "['order']", 'object_name': 'RequirementStatus'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.RequirementType']"})
        },
        'track.requirementtype': {
            'Meta': {'ordering': "['order']", 'object_name': 'RequirementType'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.response': {
            'Meta': {'ordering': "['order']", 'object_name': 'Response'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.risk': {
            'Meta': {'object_name': 'Risk'},
            'description': ('django.db.models.fields.CharField', [], {'max_length': '1024'}),
            'due_date': ('django.db.models.fields.DateTimeField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'impact': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Impact']"}),
            'probability': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Probability']"}),
            'reporter': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"}),
            'response': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Response']"}),
            'start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'status': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.RiskStatus']"})
        },
        'track.riskstatus': {
            'Meta': {'ordering': "['order']", 'object_name': 'RiskStatus'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.section': {
            'Meta': {'object_name': 'Section'},
            'department': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Department']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'})
        },
        'track.stakeholder': {
            'Meta': {'object_name': 'Stakeholder'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'project': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Project']"}),
            'section': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Section']"}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.StakeholderType']"})
        },
        'track.stakeholdertype': {
            'Meta': {'ordering': "['order']", 'object_name': 'StakeholderType'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.version': {
            'Meta': {'ordering': "['order']", 'object_name': 'Version'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        }
    }

    complete_apps = ['track']