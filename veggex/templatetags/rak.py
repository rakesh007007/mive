from django import template
register = template.Library()
@register.simple_tag()
def multiply(qty, unit_price, *args, **kwargs):
    # you would need to do any localization of the result here
    return qty * unit_price
@register.filter
def raktr(valuev):
	if len(valuev)>15:
		return valuev[:12]+'..'
	else:
		return valuev
@register.simple_tag()
def pluss(total,due):
	return total+due
