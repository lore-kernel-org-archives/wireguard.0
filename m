Return-Path: mdlayher@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15428b27
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 15:59:46 +0000 (UTC)
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5538a033
 for <wireguard@lists.zx2c4.com>; Thu, 9 Aug 2018 15:59:46 +0000 (UTC)
Received: by mail-qk0-x244.google.com with SMTP id b66-v6so4410664qkj.1
 for <wireguard@lists.zx2c4.com>; Thu, 09 Aug 2018 09:11:01 -0700 (PDT)
Return-Path: <mdlayher@gmail.com>
Received: from ?IPv6:2600:6c4a:787f:d200:d8c5:a247:1f15:2c1c?
 (2600-6c4a-787f-d200-d8c5-a247-1f15-2c1c.dhcp6.chtrptr.net.
 [2600:6c4a:787f:d200:d8c5:a247:1f15:2c1c])
 by smtp.gmail.com with ESMTPSA id w4-v6sm5155947qtb.31.2018.08.09.09.10.59
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Aug 2018 09:11:00 -0700 (PDT)
Subject: Re: wireguardctrl: Go package that enables control of WireGuard
 devices on multiple platforms
From: Matt Layher <mdlayher@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <e0d214b0-d1b4-4708-7e91-989060fcaf97@gmail.com>
Message-ID: <5569ab33-74e4-94b9-4be6-424f41517e6f@gmail.com>
Date: Thu, 9 Aug 2018 12:10:59 -0400
MIME-Version: 1.0
In-Reply-To: <e0d214b0-d1b4-4708-7e91-989060fcaf97@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I suppose this would be a good place to poll the audience for feedback 
on a question as well!

Right now I expose methods to access devices by both name and interface 
index.  However, the userspace implementations don't have the concept of 
an interface index exposed.  You can access it by doing an interface 
lookup for the tap interface name (net.InterfaceByIndex in Go), but then 
my userspace package does an immediate name lookup after that anyway.

Does it makes sense to continue to expose a way to fetch a WireGuard 
device by its interface index?  Is this useful compared to fetching a 
device by its name?  If not, I could remove it and rename the method 
"DeviceByName" to just "Device".

See: https://github.com/mdlayher/wireguardctrl/issues/6

Thanks in advance for the feedback!

- Matt


On 08/07/2018 02:16 PM, Matt Layher wrote:
> Hi all,
>
> It's been a couple of weeks since my previous thread, so I wanted to 
> follow up with a new one now that my Go package has a new name and an 
> extended scope:
>
> https://github.com/mdlayher/wireguardctrl
>
> wireguardctrl is a Go package that abstracts away the WireGuard 
> kernel, userspace, and any future OS-specific interfaces.
>
> At this point, I've got all of the device and peer retrieval 
> functionality done, but I still need to implement device peer 
> configuration for both the kernel and userspace interfaces.  There are 
> a couple issues open around this topic.
>
> I think this package is at a point where I'd feel comfortable having 
> folks try it out and see what happens.  I've got some integration 
> tests hooked up in Travis CI for both the kernel and userspace 
> modules, and it seems to work well!  My next plan is to consider 
> building some kind of one-shot utility for setting up a tunnel by 
> running a small program on two machines.
>
> Thanks for your time, and feel free to reach out here or on IRC for 
> any questions.
>
> - Matt Layher
>
> PS: Jason, if you do end up making a language bindings page for the 
> website, I'd still like this package to be listed there!  I also found 
> the beginnings of a Python library today: 
> https://github.com/apognu/wgctl.
>
