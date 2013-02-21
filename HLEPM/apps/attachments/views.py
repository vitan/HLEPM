from django.shortcuts import render_to_response, get_object_or_404
from django.views.decorators.http import require_POST
from django.http import HttpResponseRedirect
from django.db.models.loading import get_model
from django.core.urlresolvers import reverse
from django.utils.translation import ugettext, ugettext_lazy as _
from django.template.context import RequestContext
from django.contrib.auth.decorators import login_required
from HLEPM.apps.attachments.models import Attachment
from HLEPM.apps.attachments.forms import AttachmentForm

def add_url_for_obj(obj):
    return reverse('add_attachment', kwargs={
                        'app_label': obj._meta.app_label,
                        'module_name': obj._meta.module_name,
                        'pk': obj.pk
                    })

@require_POST
@login_required
def add_attachment(request, app_label, module_name, pk,
                   ajax_response, template_name='attachments/add.html'):

    model = get_model(app_label, module_name)
    if model is None:
        # TODO (weizhou) error warning!
        pass
    obj = get_object_or_404(model, pk=pk)
    form = AttachmentForm(request.POST, request.FILES)

    if form.is_valid():
        form.save(request, obj)
    else:
        # TODO (weizhou) error warning!
        pass

@login_required
def update_attachment(request, app_label, module_name, pk,
                   ajax_response, template_name=''):

    model = get_model(app_label, module_name)
    if model is None:
        # TODO (weizhou) error warning!
        pass
    obj = get_object_or_404(model, pk=pk)
    form = AttachmentForm(request.POST, request.FILES)

    if form.is_valid():
        form.update(request, obj)
    else:
        # TODO (weizhou) error warning!
        pass

@login_required
def delete_attachment(request, attachment_pk, ajax_response):
    g = get_object_or_404(Attachment, pk=attachment_pk)
    if request.user.has_perm('delete_foreign_attachments') \
       or request.user == g.creator:
        g.delete()
    #TODO (weizhou) error warning!
    pass
