from django import template

register = template.Library()

@register.filter
def app_label(value):
    return value._meta.app_label

@register.filter
def module_name(value):
    return value._meta.module_name
