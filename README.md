# wait_xcrun plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-wait_xcrun)
[![version](https://img.shields.io/github/tag/mgrebenets/fastlane-plugin-wait_xcrun.svg?color=green&label=version)](https://badge.fury.io/gh/mgrebenets%2Ffastlane-plugin-wait_xcrun)
[![CircleCI](https://circleci.com/gh/mgrebenets/fastlane-plugin-wait_xcrun.svg?style=svg)](https://circleci.com/gh/mgrebenets/fastlane-plugin-wait_xcrun)
[![Travis CI](https://img.shields.io/travis/mgrebenets/fastlane-plugin-wait_xcrun.svg?label=%20&logo=travis)](https://travis-ci.org/mgrebenets/fastlane-plugin-wait_xcrun)
[![Coveralls](https://img.shields.io/coveralls/github/mgrebenets/fastlane-plugin-wait_xcrun.svg?label=coverage)](https://travis-ci.org/mgrebenets/fastlane-plugin-wait_xcrun)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-wait_xcrun`, add it to your project by running:

```bash
fastlane add_plugin wait_xcrun
```

## About wait_xcrun

Wait for Xcode toolchain to come back online after switching Xcode versions.

In particular, the plugin is designed to help with issues like this: https://github.com/fastlane/fastlane/issues/5435.

This kind of issue often happens on CI servers, for example when previous build was using Xcode 7.3.1 and next build is using Xcode 8. Switching Xcode version can cause Xcode toolchain commands to fail.

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

The recommended way is to call `wait_xcrun` in `before_all` hook, but _after_ the `DEVELOPER_DIR` environment variable has been set.

```ruby
before_all do
  # Make sure proper Xcode version is selected by CI server
  # or by setting DEVELOPER_DIR environment variable

  wait_xcrun
end
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```shell
rake
```

To automatically fix many of the styling issues, use

```shell
rubocop -a
```

To see the real issue "in action", make sure you have both Xcode 8 and Xcode 7.3.1 installed in `/Applications`.
Specify the name of Xcode 8 and Xcode 7.3.1 apps without the `.app` extension using `prev_xcode` and `next_xcode` options and run `switch_xcode_test` lane.

```shell
# In this example Xcode 8 is installed to /Applications/Xcode.app
# Xcode 7.3.1 is installed to /Applications/Xcode7.3.1.app
bundle exec fastlane switch_xcode_test prev_xcode:Xcode next_xcode:Xcode7.3.1
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/PluginsTroubleshooting.md) doc in the main `fastlane` repo.

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Plugins.md).

## About `fastlane`

`fastlane` is the easiest way to automate building and releasing your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
