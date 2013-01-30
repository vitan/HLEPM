# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Product'
        db.create_table('track_product', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
        ))
        db.send_create_signal('track', ['Product'])

        # Adding model 'RequirementContent'
        db.create_table('track_requirementcontent', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['RequirementContent'])

        # Adding model 'RequirementStatus'
        db.create_table('track_requirementstatus', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
            ('content', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.RequirementContent'])),
        ))
        db.send_create_signal('track', ['RequirementStatus'])

        # Adding model 'RequirementOwner'
        db.create_table('track_requirementowner', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
            ('content', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.RequirementContent'])),
        ))
        db.send_create_signal('track', ['RequirementOwner'])

        # Adding model 'Version'
        db.create_table('track_version', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['Version'])

        # Adding model 'Requirement'
        db.create_table('track_requirement', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
            ('author', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['auth.User'])),
            ('start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('target_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('content', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.RequirementContent'])),
            ('status', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.RequirementStatus'])),
            ('owner', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.RequirementOwner'])),
            ('product', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Product'], null=True, blank=True)),
            ('version', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Version'], null=True, blank=True)),
            ('update', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, auto_now_add=True, blank=True)),
        ))
        db.send_create_signal('track', ['Requirement'])

        # Adding M2M table for field requirement on 'Requirement'
        db.create_table('track_requirement_requirement', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('from_requirement', models.ForeignKey(orm['track.requirement'], null=False)),
            ('to_requirement', models.ForeignKey(orm['track.requirement'], null=False))
        ))
        db.create_unique('track_requirement_requirement', ['from_requirement_id', 'to_requirement_id'])

        # Adding model 'Phase'
        db.create_table('track_phase', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['Phase'])

        # Adding model 'ProjectType'
        db.create_table('track_projecttype', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['ProjectType'])

        # Adding model 'ProjectStatus'
        db.create_table('track_projectstatus', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['ProjectStatus'])

        # Adding model 'ProjectOwner'
        db.create_table('track_projectowner', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['ProjectOwner'])

        # Adding model 'Project'
        db.create_table('track_project', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('description', self.gf('django.db.models.fields.CharField')(max_length=1024, null=True, blank=True)),
            ('product', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Product'])),
            ('requirement', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Requirement'])),
            ('version', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Version'])),
            ('status', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.ProjectStatus'])),
            ('owner', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.ProjectOwner'])),
            ('project_manager', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['auth.User'])),
            ('start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('end_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.ProjectType'])),
            ('update', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, auto_now_add=True, blank=True)),
        ))
        db.send_create_signal('track', ['Project'])

        # Adding model 'MemberType'
        db.create_table('track_membertype', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['MemberType'])

        # Adding model 'Member'
        db.create_table('track_member', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=512)),
            ('type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.MemberType'])),
            ('project', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Project'])),
        ))
        db.send_create_signal('track', ['Member'])

        # Adding model 'StakeholderType'
        db.create_table('track_stakeholdertype', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['StakeholderType'])

        # Adding model 'Department'
        db.create_table('track_department', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
        ))
        db.send_create_signal('track', ['Department'])

        # Adding model 'Section'
        db.create_table('track_section', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
            ('department', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Department'])),
        ))
        db.send_create_signal('track', ['Section'])

        # Adding model 'Stakeholder'
        db.create_table('track_stakeholder', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.StakeholderType'])),
            ('project', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Project'])),
            ('section', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Section'])),
        ))
        db.send_create_signal('track', ['Stakeholder'])

        # Adding model 'Impact'
        db.create_table('track_impact', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['Impact'])

        # Adding model 'Response'
        db.create_table('track_response', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['Response'])

        # Adding model 'Priority'
        db.create_table('track_priority', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['Priority'])

        # Adding model 'Probability'
        db.create_table('track_probability', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['Probability'])

        # Adding model 'RiskStatus'
        db.create_table('track_riskstatus', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['RiskStatus'])

        # Adding model 'Risk'
        db.create_table('track_risk', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('reporter', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['auth.User'])),
            ('impact', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Impact'])),
            ('probability', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Probability'])),
            ('response', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Response'])),
            ('status', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.RiskStatus'])),
            ('start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('due_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('description', self.gf('django.db.models.fields.CharField')(max_length=1024)),
        ))
        db.send_create_signal('track', ['Risk'])

        # Adding model 'IssueStatus'
        db.create_table('track_issuestatus', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(unique=True, max_length=150)),
            ('order', self.gf('django.db.models.fields.PositiveIntegerField')()),
        ))
        db.send_create_signal('track', ['IssueStatus'])

        # Adding model 'Issue'
        db.create_table('track_issue', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('reporter', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['auth.User'])),
            ('impact', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Impact'])),
            ('priority', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Priority'])),
            ('status', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.IssueStatus'])),
            ('start_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('dur_date', self.gf('django.db.models.fields.DateTimeField')()),
            ('description', self.gf('django.db.models.fields.CharField')(max_length=1024)),
        ))
        db.send_create_signal('track', ['Issue'])

        # Adding model 'RequirementHistory'
        db.create_table('track_requirementhistory', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('editor', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['auth.User'])),
            ('requirement', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Requirement'])),
            ('owner', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.RequirementOwner'])),
            ('start_date', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('end_date', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal('track', ['RequirementHistory'])

        # Adding model 'ProjectHistory'
        db.create_table('track_projecthistory', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('editor', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['auth.User'])),
            ('project', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.Project'])),
            ('type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['track.ProjectType'])),
            ('start_date', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
            ('end_date', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal('track', ['ProjectHistory'])


    def backwards(self, orm):
        # Deleting model 'Product'
        db.delete_table('track_product')

        # Deleting model 'RequirementContent'
        db.delete_table('track_requirementcontent')

        # Deleting model 'RequirementStatus'
        db.delete_table('track_requirementstatus')

        # Deleting model 'RequirementOwner'
        db.delete_table('track_requirementowner')

        # Deleting model 'Version'
        db.delete_table('track_version')

        # Deleting model 'Requirement'
        db.delete_table('track_requirement')

        # Removing M2M table for field requirement on 'Requirement'
        db.delete_table('track_requirement_requirement')

        # Deleting model 'Phase'
        db.delete_table('track_phase')

        # Deleting model 'ProjectType'
        db.delete_table('track_projecttype')

        # Deleting model 'ProjectStatus'
        db.delete_table('track_projectstatus')

        # Deleting model 'ProjectOwner'
        db.delete_table('track_projectowner')

        # Deleting model 'Project'
        db.delete_table('track_project')

        # Deleting model 'MemberType'
        db.delete_table('track_membertype')

        # Deleting model 'Member'
        db.delete_table('track_member')

        # Deleting model 'StakeholderType'
        db.delete_table('track_stakeholdertype')

        # Deleting model 'Department'
        db.delete_table('track_department')

        # Deleting model 'Section'
        db.delete_table('track_section')

        # Deleting model 'Stakeholder'
        db.delete_table('track_stakeholder')

        # Deleting model 'Impact'
        db.delete_table('track_impact')

        # Deleting model 'Response'
        db.delete_table('track_response')

        # Deleting model 'Priority'
        db.delete_table('track_priority')

        # Deleting model 'Probability'
        db.delete_table('track_probability')

        # Deleting model 'RiskStatus'
        db.delete_table('track_riskstatus')

        # Deleting model 'Risk'
        db.delete_table('track_risk')

        # Deleting model 'IssueStatus'
        db.delete_table('track_issuestatus')

        # Deleting model 'Issue'
        db.delete_table('track_issue')

        # Deleting model 'RequirementHistory'
        db.delete_table('track_requirementhistory')

        # Deleting model 'ProjectHistory'
        db.delete_table('track_projecthistory')


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
            'content': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.RequirementContent']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'}),
            'owner': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.RequirementOwner']"}),
            'product': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Product']", 'null': 'True', 'blank': 'True'}),
            'requirement': ('django.db.models.fields.related.ManyToManyField', [], {'blank': 'True', 'related_name': "'requirement_requirement'", 'null': 'True', 'symmetrical': 'False', 'to': "orm['track.Requirement']"}),
            'start_date': ('django.db.models.fields.DateTimeField', [], {}),
            'status': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.RequirementStatus']"}),
            'target_date': ('django.db.models.fields.DateTimeField', [], {}),
            'update': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'auto_now_add': 'True', 'blank': 'True'}),
            'version': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.Version']", 'null': 'True', 'blank': 'True'})
        },
        'track.requirementcontent': {
            'Meta': {'ordering': "['order']", 'object_name': 'RequirementContent'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
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
            'content': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.RequirementContent']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '150'}),
            'order': ('django.db.models.fields.PositiveIntegerField', [], {})
        },
        'track.requirementstatus': {
            'Meta': {'ordering': "['order']", 'object_name': 'RequirementStatus'},
            'content': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['track.RequirementContent']"}),
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