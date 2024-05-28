// A lint file of lintnet.
// https://lintnet.github.io/
function(param)
  if std.objectHas(param.config, 'types') then
    if std.type(param.config.types) == 'array' then
      if std.all(std.map(function(a) std.type(a) == 'string', param.config.types)) then
        std.sort([
          {
            name: 'This resource type is forbidden',
            location: {
              type: resource.type,
              address: resource.address,
            },
          }
          for module in [param.data.value.planned_values.root_module] + std.get(param.data.value.planned_values, 'child_modules', [])
          for resource in module.resources
          if std.member(param.config.types, resource.type)
        ], function(elem) elem.location.address)
      else [
        {
          name: 'This resource type is forbidden',
          message: 'The config "types" must be an array of string',
          custom: {
            types: param.config.types,
          },
        },
      ]
    else [
      {
        name: 'This resource type is forbidden',
        message: 'The config "types" must be an array',
        custom: {
          types: param.config.types,
        },
      },
    ]
  else [
    {
      name: 'This resource type is forbidden',
      message: 'The config "types" is required',
    },
  ]
