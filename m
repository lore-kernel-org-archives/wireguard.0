Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6108bd1d
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 13:26:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d42ad777
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 13:26:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55eda180
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 13:26:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eef2a709
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 13:26:04 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id w63so177750545oiw.0
 for <wireguard@lists.zx2c4.com>; Tue, 20 Dec 2016 05:33:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <59811706-CB39-4A8F-823B-9B270ABFD211@danrl.com>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
 <20161220011334.GB16814@tuxmachine.polynome.dn42>
 <CAHmME9rDK0MEFH2oOVjeTF0n=J6=Hsk9e5Hyj2GDnFk8V3LtwA@mail.gmail.com>
 <89D5D16F-84AF-4FC6-9AA1-55EFCB6A3B9E@danrl.com>
 <CAHmME9popkFYu-am43TMCc6NcPtUA5dYRWPuTDJS-B69L73_cQ@mail.gmail.com>
 <40FCA8CB-1FAA-42AF-B229-8692568F8226@danrl.com>
 <59811706-CB39-4A8F-823B-9B270ABFD211@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 20 Dec 2016 14:33:06 +0100
Message-ID: <CAHmME9p8KwzZONpAk=hF1GBQ_psR6Hjgv5yAxvogHxvm4KpfSg@mail.gmail.com>
Subject: Re: openwrt route_allowed_ips is inprecise
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Dan,

On Tue, Dec 20, 2016 at 11:15 AM, Dan L=C3=BCdtke <mail@danrl.com> wrote:
> New environment, build from latest sources this morning. Can't reproduce.=
 I can't see duplicate routes. Static routes were added via LuCI to represe=
nt a typical user's approach.
>
> Can we drop this discussion until we can reproduce the problem?

That's a weird way of putting it, because you !=3D we.

config wireguard_wg
       option public_key '0Nz4n2wdhDJtFbkdIFqlJ4vkKIGFgBVQPxyJ0XWE31o=3D'
       list allowed_ips '10.200.100.1/32'
       option route_allowed_ips '1'
config interface 'wgnet'
       option proto 'static'
       option ifname 'wg'
       option ipaddr '10.200.100.4/24'
-->
root@mipsnet:~# ip r
10.200.100.0/24 dev wg  src 10.200.100.4
10.200.100.1 dev wg


We can drop the discussion, though, because Baptiste, the downstream
package maintainer, doesn't want to maintain that kind of logic and
evidently finds Linux's v4 LC-trie and v6 radix trie to be fast enough
for his purposes. I don't find the duplicated entries very desirable,
but I'm totally fine deferring to his judgement.

>> I am on it. First version did add dependency for both protocols if the e=
ndpoint name had A and AAAA records. However, I find it cleaner to check wh=
ich endpoint wg chose to use and only add that IP address as an depedency. =
Patch/PR comes when I am satisfied with stability.

I think calling `wg show $if endpoints` like you do is the correct
solution. Good thinking. I'll put some comments on the PR.

Jason
