shimizukawa-env Cookbook
=========================

This cookbook treat shimizukawa's development environment.

Requirements
------------


Attributes
----------

- `default["shimizukawa_env"]["user"]` - default is "vagrant"
- `default["shimizukawa_env"]["group"]` - default is "vagrant"

Usage
-----
#### python-build::default

Just include `shimizukawa-env` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[shimizukawa-env]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Takayuki Shimizukawa
License: Apache 2.0
