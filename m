Return-Path: mail@dariobosch.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25da3efd
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jun 2018 06:57:53 +0000 (UTC)
Received: from mx2f2c.netcup.net (mx2f2c.netcup.net [188.68.47.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fda69a12
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jun 2018 06:57:52 +0000 (UTC)
Received: from [192.168.178.221] (p54A69489.dip0.t-ipconnect.de
 [84.166.148.137])
 by mx2f2c.netcup.net (Postfix) with ESMTPSA id 5B11460AE5
 for <wireguard@lists.zx2c4.com>; Sat, 23 Jun 2018 09:02:58 +0200 (CEST)
To: wireguard@lists.zx2c4.com
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
 <296DF757-2B21-4F54-9444-1EEBD4A40BEA@lonnie.abelbeck.com>
 <WPqGtU0DfSVI-hq2mee5j7VBN3_KVfJjWsf1-2MDe_1z2uIk7dBWnHF733CM6d9dF1dlhC-bEMy7naNqyAOtKnRZnYYoj5B4TZffzAJF6bA=@protonmail.ch>
 <654faeee-748b-77e6-2b26-a5216800b6d0@unstable.cc>
From: Dario Bosch <mail@dariobosch.de>
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
Message-ID: <0674ca33-bccc-95f3-ab9f-674943b6cc3d@dariobosch.de>
Date: Sat, 23 Jun 2018 09:02:58 +0200
MIME-Version: 1.0
In-Reply-To: <654faeee-748b-77e6-2b26-a5216800b6d0@unstable.cc>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi all,

I've been following this discussion and now also want to add my 2 cents.

In my opinion wireguard's biggest strength is the simplicity of its
config. One can write a 8-line config file that works reliably, is
secure and also can take care of ip tables rules, start services etc.
Even a user who only has a rough understanding about their system can
achieve this.
Everything that makes using wireguard more complicated should be
avoided. Setting up other VPNs such as openVPN is a hassle simply
because they are *not* designed to be simple.

We are discussing about an attack scenario, where the attacker convinces
a clueless user to compile/install a kernel module, we always should
keep that in mind. Most installation instructions advise people to add a
custom repository or clone a git repository, so they're already running
foreign, untrusted code with root rights.

In my opinion the only viable option would be to computer a check-sum
over the {Pre/Post}{Up/Down} lines in the config files i wg-quick. In
case the check-sum has changed, the user could then be asked to trust
this file. I imagine it a bit like that:

    [root@machine /]$ wg-quick up myWG
    [#] *New Post-Up rule detected*
    [#] Warning: The selected config file will execute the following
    [#] commands when loaded:
    [#]      'rm -rf /'
    [#] Do you want to trust this config file? [y]/[n]
       > y
    [#] Rule added to list of trusted config, continuing
    ...

Again, I think making wireguard usage more complicated and annoying than
necessary should be avoided.

Cheers,
Dario




On 06/23/2018 04:36 AM, Antonio Quartulli wrote:
> Hi,
> 
> On 23/06/18 06:13, Jordan Glover wrote:
> [cut]
>>
>> But attacker will helpfully provide you customized 'wireguard.script'  as well
>> and even tell you how to use it by setting 'chmod 4777 wireguard.script'.
>>
> 
> An attacker will also tell you to run "rm -Rf /" :-P
> 
> 
> Jokes apart, I was talking to Jason on IRC and I suggested an idea that
> might be worth sharing.
> 
> A network device driver in the kernel is free to send events to
> userspace with any custom set of properties/values.
> 
> Most of you have already seen and played with those typically thrown
> when an interface goes up and down, with udev normally handling them by
> executing some (user-)configured action.
> 
> These events can be easily created and customized by any kernel module
> and associated to a network interface.
> Wireguard could generate preup/postup/etc.. uevents and send them to
> userspace.
> 
> It will then be udev to decide how to handle those.
> Specific scripts could be installed by the admin, or udev could come
> with its own default ones.
> 
> In any case, this would delegate the execution of scripts to a component
> that is in charge of doing exactly that.
> 
> This would remove the risk of sneaking malicious things into the
> configuration file, which is what people do not expect and is the core
> of the issue discussed here.
> 
> (Yeah, I already hear people saying "but the malicious attacker will
> tell the clueless user to install this script in udev", but I think that
> by then, the problem has moved to another plane)
> 
> My experience with this mechanism comes from batman-adv[1], where it
> used to report special routing events to the user so that he could react
> accordingly (if desired).
> 
> 
> just my 2 cents.
> 
> 
> Cheers,
> 
> [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/net/batman-adv/sysfs.c#n1209
> 
> 
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
