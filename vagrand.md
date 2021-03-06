# Vagrant virtualBox

Via the documentation, --no-bin-links "tells npm to create symlinks (or .cmd shims on Windows) for package executables".

    sudo npm install --no-bin-links

http://blog.rudylee.com/2014/10/27/symbolic-links-with-vagrant-windows/

#vagrant-fsnotify

Forward filesystem change notifications to your Vagrant VM.

Problem

Some filesystems (e.g. ext4, HFS+) have a feature of event notification. Interested applications can subscribe and are notified when filesystem events happen (e.g. a file was created, modified or deleted).

Applications can make use of this system to provide features such as auto-reload or live updates. For example, Jekyll regenerates the static website and Guard triggers a test run or a build when source files are modified.

Unfortunately, Vagrant users have a hard time making use of these features when the application is running inside a virtual machine. When the file is modified on the host, the event is not propagated to the guest and the auto-reload never happens.

There are several bug reports related to this issue:

    https://www.virtualbox.org/ticket/10660
    https://github.com/guard/listen/issues/53
    https://github.com/guard/listen/issues/57
    https://github.com/guard/guard/issues/269
    https://github.com/mitchellh/vagrant/issues/707

There are two generally accepted solutions. The first is fall back to long polling, the other is to forward the events over TCP. The problem with long polling is that it's painfully slow, especially in shared folders. The problem with forwarding events is that it's not a general approach that works for any application.

Solution

vagrant-fsnotify proposes a different solution: run a process listening for filesystem events on the host and, when a notification is received, access the virtual machine guest and touch the file in there (or touch followed by a rm in case of file removals), causing an event to be propagated on the guest filesystem.

This leverages the speed of using real filesystem events while still being general enough to don't require any support from applications.

Caveats

Due to the nature of filesystem events and the fact that vagrant-fsnotify uses touch, the events are triggerred back on the host a second time. To avoid infinite loops, we add an arbitrary debounce of 2 seconds between touch-ing the same file. Thus, if a file is modified on the host more than once in 2 seconds the VM will only see one notification. If the second trigger on the host or this arbitrary debounce is unacceptable for your application, vagrant-fsnotify might not be for you.

Installation

vagrant-fsnotify is a Vagrant plugin and can be installed by running:

    $ vagrant plugin install vagrant-fsnotify

Vagrant version 1.7.3 or greater is required.

Usage

Basic setup

In Vagrantfile synced folder configuration, add the fsnotify: true option. For example, in order to enable vagrant-fsnotify for the the default /vagrant shared folder, add the following:

    config.vm.synced_folder ".", "/vagrant", fsnotify: true

When the guest virtual machine is up, run the following:

    $ vagrant fsnotify

This starts the long running process that captures filesystem events on the host and forwards them to the guest virtual machine.

