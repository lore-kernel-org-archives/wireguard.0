Return-Path: whit@transpect.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3284d4ff
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:22:57 +0000 (UTC)
Received: from black.transpect.com (vt.electrainfo.com [207.136.236.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80ab2442
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:22:57 +0000 (UTC)
Date: Mon, 4 Dec 2017 12:29:37 -0500
From: Whit Blauvelt <whit@transpect.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: What are the options for stopping and starting?
Message-ID: <20171204172937.GA11936@black.transpect.com>
References: <20171204160159.GA27666@black.transpect.com>
 <CAHmME9o3+SBZfsWLUczAxKOxmBcWeJYyx_wpGnk_sXNbb8aZgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9o3+SBZfsWLUczAxKOxmBcWeJYyx_wpGnk_sXNbb8aZgA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

Thanks for the quick response. I've read through that man page several
times. Questions remain. 

So "setconf <interface> <configuration-filename>" is the basic equivalent of
"service reload" or the like. Okay. 

Is there a preferred way to take WireGuard fully down? We could unload the
wireguard (and ip6_udp_tunnel and udp_tunnel?) modules. But that seems a
crude method. What's perferred? I see we can "set <interface> remove", but
is there a simple command to take them all down? (One could obviously be
scripted; just wondering if I'm missing that one's already there.)

Also, what's "SaveConfig" about? I see I got that from wg-quick:
https://git.zx2c4.com/WireGuard/about/src/tools/wg-quick.8. I see now in
testing that that line's not accepted by wg once it's in the conf file --
nor is the Address line that shows up with wg-quick. I don't see where the
docs are clear that wg-quick and wg can't work from the same conf files.

I'm not complaining. Just trying to help get clarity for myself and others.
Your man pages are well written. But I'm sure you know there's much more to
say. My impression so far is that wg-quick probably shouldn't be used at all
outside of a specific road-warrior situation. Is that correct?

I'm also trying to fully understand the "kill switch" discussion in the
wg-quick man page. Is it the case, given standard use of wg (without
wg-quick), that its wg interfaces are available for unencyrpted traffic just
if wg itself isn't actively sitting on them? Or is this vulnerabilty
specific to wg-quick usage?

Best,
Whit

On Mon, Dec 04, 2017 at 05:14:01PM +0100, Jason A. Donenfeld wrote:
> Hi Whit,
> 
> See the man page of wg(8):
> 
> $ man 8 wg
> 
> For your convenience it can be found online here:
> https://git.zx2c4.com/WireGuard/about/src/tools/wg.8
> 
> Regards,
> Jason
