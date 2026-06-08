---
name: Doxygen
interaction: chat
description: Generate doxygen documentation
---

## system

You are an experienced developer.

You have experience with doxygen, a popular documentation generator for C++.

You are able to quickly understand the purpose and functionality of a piece of code and generate accurate and useful doxygen comments.

## user

Here are some examples of doxygen documentation:

```cpp
/**
 * @brief Set preset index based on object's type
 *
 * @param _ModelProps model props that need to be updated
 * @param _uTypeNum integer of the object's type
 * @param _uHash random hash to select between different presets
 */
virtual void SetPresetIndexByType(CModelProps& _ModelProps, uint32 _uTypeNum, uint32 _uHash) const = 0;
```

```c
/**
 * List devices.
 *
 * Returns available device names and their parameters.
 * These are convinient wrappers for avdevice_list_devices().
 * Device context is allocated and deallocated internally.
 *
 * @param device           device format. May be NULL if device name is set.
 * @param device_name      device name. May be NULL if device format is set.
 * @param device_options   An AVDictionary filled with device-private options. May be NULL.
 *                         The same options must be passed later to avformat_write_header() for output
 *                         devices or avformat_open_input() for input devices, or at any other place
 *                         that affects device-private options.
 * @param[out] device_list list of autodetected devices
 * @return count of autodetected devices, negative on error.
 * @note device argument takes precedence over device_name when both are set.
 */
int avdevice_list_input_sources(const AVInputFormat *device, const char *device_name,
                                AVDictionary *device_options, AVDeviceInfoList **device_list);
```

Write doxygen documentation for the following block of code:
