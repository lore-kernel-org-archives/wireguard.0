Return-Path: <SRS0=vHM2=2B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969C2C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Dec 2019 01:08:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2A6B206D9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Dec 2019 01:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2A6B206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46fdc603;
	Wed, 11 Dec 2019 01:08:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b40110b4
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Dec 2019 01:08:01 +0000 (UTC)
Received: from www119.your-server.de (www119.your-server.de [88.198.193.7])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5ba0d31
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Dec 2019 01:08:01 +0000 (UTC)
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www119.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1) (envelope-from <knupps@gmx.de>) id 1ieqTv-0000JV-Vl
 for wireguard@lists.zx2c4.com; Wed, 11 Dec 2019 02:08:00 +0100
Received: from [188.97.62.4] (helo=polaris.naturlan.loc)
 by sslproxy05.your-server.de with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <knupps@gmx.de>) id 1ieqTv-000XFk-QK
 for wireguard@lists.zx2c4.com; Wed, 11 Dec 2019 02:07:59 +0100
Received: from triton.naturlan.loc ([192.168.0.10])
 by polaris.naturlan.loc with esmtp (Exim 4.90_1)
 (envelope-from <knupps@gmx.de>) id 1ieqTv-0003Fe-AZ
 for wireguard@lists.zx2c4.com; Wed, 11 Dec 2019 02:07:59 +0100
Subject: Re: Windows client: PostUp/PreDown possible?
To: wireguard@lists.zx2c4.com
References: <04a38f45-1043-0db5-6c76-2ee573fd71cf@malte-wetz.de>
 <CAHmME9qwJ-+qv6CBLDL05qMQdi6KPkM5MS2aT7-5q7hM6QN+4g@mail.gmail.com>
From: Mark Schmidt <knupps@gmx.de>
Message-ID: <824f312d-684f-2b5a-2920-a8bac1df2b77@malte-wetz.de>
Date: Wed, 11 Dec 2019 02:07:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9qwJ-+qv6CBLDL05qMQdi6KPkM5MS2aT7-5q7hM6QN+4g@mail.gmail.com>
Content-Language: en-GB
X-Transferred-By: mail.naturlan.loc
X-Authenticated-Sender: info@naturlan.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25659/Tue Dec 10 10:49:44 2019)
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Am 10.12.2019 um 20:22 schrieb Jason A. Donenfeld:
> We'd considered it, but the fear is that it will be used to spread
> malware and RCE. Linux command line users can generally be trusted to
> check the config files they're writing into /etc/wireguard, but I
> don't have that same feeling about plug-and-chug Windows users
> pointing and clicking their way to BonziBuddy. That's possibly a bit
> of a patronizing perspective, I realize, but the potential for havoc
> is pretty high.
> 
> Thoughts?

I think if you want the client to be useable, you should do it. 
Otherwise, someone else will implement it. TunSafe, for instance, has 
the options. So would a user or organisation be better off switching to 
that software if they need this feature? Or would it not be better 
overall to incentivise the use of the *official* client?

Just giving you my personal experience. That's what I did. The software 
didn't do what I wanted, so my first instinct was to look for another 
software. Which lead me to TunSafe. I eventually decided against it and 
kept using Wireguard for Windows anyway (for reasons stated below), but 
that's what happens in these cases.

Also, I've noticed that the GUI won't work under normal user accounts. 
Only members of the admin group can activate and deactivate tunnels. 
Meaning: Everyone who wants to use the GUI (the plug and play Windows 
dummies) is forced to always work with admin privileges. While many 
people do that anyway (so many in fact that MS had to introduce the UAC 
as a band-aid), it's still not so great for security. Yet evidently not 
considered a problem for Wireguard. So it seems like a bit of a double 
standard. No offense.

And when people try to work around the limitation, they might also 
create additional issues. Even if it's just in the form of increased 
complexity.

Case in point: The way I worked around the limitation was to a use 
wrapper script that calls Wireguard from the command line via surun (a 
third party program that is kind of like 'sudo' for Windows) so that the 
user doesn't have to be admin, then waits for the server to show up and 
connects to it. It works, but I wouldn't call it pretty.

For anyone interested in the solution - for lack of a better term -, 
this is the "connect" script (bells and whistles - like error handling - 
omitted):

,----
| surun "C:\Program Files\Wireguard\wireguard.exe" ^
|   /installtunnelservice "C:\Users\Public\Documents\mytunnel.conf"
| :ping
| timeout /t 1 /nobreak >NUL
| (ping -n 1 10.0.0.1 | find "TTL=" >NUL) || goto ping
| net use z: \\10.0.0.1\data
`----

And likewise, the "disconnect" scripts looks like this:

,----
| net use z: /delete /yes
| surun "C:\Program Files\Wireguard\wireguard" ^
|   /uninstalltunnelservice "mytunnel"
`----

Some PostUp/PreDown commands would probably be more elegant.

Even if I grant that the security concerns are valid, other ways to 
mitigate them exist. For example: I for one would be perfectly ok if the 
options were ignored by default and you'd have to manually enable them 
somewhere first. Maybe acknowledging you're using them at your own risk. 
TunSafe does that, by the way. You have to check a box in the menu 
before you can use the options. That seems like a reasonable compromise.


By the way: The way that TunSafe implements these options is not well 
suited for what I want to do. It runs the PostUp command after the 
interface has been set up, but before the tunnel is up. So a script 
trying to connect to a network share will not find the server. And it 
also can't just ping the server until it's available and connect then. 
Because TunSafe always waits for the command to finish before it 
continues. That creates a deadlock (TunSafe waits for the script, and 
the script waits for the server, which won't appear because TunSafe is 
waiting). Even using the 'start' command from Windows (which launches a 
program in the background, sort of like adding an '&' in a Linux shell) 
does not work.

So I would suggest an option that's either run after IP connectivity is 
established. Or at least one that doesn't (necessarily) block. I can see 
why waiting for the command to finish before actually creating the 
tunnel could be useful in some cases. But not in every case, so a little 
bit of flexibility might be warranted.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
