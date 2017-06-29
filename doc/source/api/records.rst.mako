.. _records:

Records
=======

<%! import glob, inspect, re, sys %>
<%
modules = [m for m in sys.modules.keys() if m.startswith('pyramid_oereb')]
files = glob.glob('../../pyramid_oereb/lib/records/*.py')
modules = [
    re.sub(r'\.__init__', '', f[6:-3].replace("/", ".")) for f in files
]
modules.sort()
for module in modules:
    __import__(module)
    # TODO: Ask SBrunner why this is not working as expected (packages are missing)
    # modules = [m for m in modules if m in sys.modules]

classes = {}
for module in modules:
    classes[module] = []
    for name, obj in inspect.getmembers(sys.modules[module]):
        if inspect.isclass(obj) and obj.__module__ == module:
            classes[module].append(name)

underline = ['-', '`', '\'', '.', '~', '*']
%>

%for module in modules:
.. _api-${module.replace('.', '-').lower()}:

.. automodule:: ${module}

%for cls in classes[module]:
.. _api-${module.replace('.', '-').lower()}-${cls.lower()}}:

*${cls}*
${re.sub('.', underline[0], 'Class   ' + cls)}

.. autoclass:: ${module}.${cls}
   :members:
   :inherited-members:
   :show-inheritance:

   .. automethod:: __init__

%endfor
%endfor