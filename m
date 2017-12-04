Return-Path: whit@transpect.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af27e272
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 19:21:13 +0000 (UTC)
Received: from black.transpect.com (vt.electrainfo.com [207.136.236.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cdd1ffd
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 19:21:13 +0000 (UTC)
Date: Mon, 4 Dec 2017 14:27:52 -0500
From: Whit Blauvelt <whit@transpect.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: What are the options for stopping and starting?
Message-ID: <20171204192752.GB5311@black.transpect.com>
References: <20171204160159.GA27666@black.transpect.com>
 <CAHmME9o3+SBZfsWLUczAxKOxmBcWeJYyx_wpGnk_sXNbb8aZgA@mail.gmail.com>
 <20171204172937.GA11936@black.transpect.com>
 <CAHmME9oksyuGfxEAxeoSmdwaiYhLZjyVSeZc7LCCYcc3KwnRLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9oksyuGfxEAxeoSmdwaiYhLZjyVSeZc7LCCYcc3KwnRLg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Dec 04, 2017 at 07:06:27PM +0100, Jason A. Donenfeld wrote:

> Sort of but not quite. You're thinking about this all wrong though and
> you're going to get into trouble. There aren't services or daemons.

Hi Jason,

Thanks for the quick, detailed answers.

While it's obvious wg-quick is a special purpose script, the precise niche
it's good for is underspecified; as is the incompatibility of the resulting
extra lines in the conf files. So if you were going to expand the docs to
avoid confusing average sysadmins like me, those would be nice things to
add.

I hope I was clear that I understand this is not about services or daemons
in userspace (although wg-quick has some daemonic properties). Yet in a way
it's normal to think of a VPN as a service, even if with WireGuard the
service is provided by the kernal rather than a user-space daemon. Yeah,
it's not the technical use of "service," but it's regular English, like
"telephone service" or "postal service."

It's natural in that metaphor of "service" to ask how to "turn it on" and
"turn it off." Okay, so "ip link set wg0 down" is the off switch; and "wg
setconf wg0 wg0.conf" is the on switch?

If so, it's just a bit unusual to have the off switch be outside of the
product (wg), while the on switch is inside it. Each command makes sense;
having them be so far apart is an unusual placement. I respect you're
adherence to KISS here. Yet an additional option like "wg setconf wg0
standby" (to set the link down while perserving the options if possible), or
"wg setconf wg0 off" (to turn it off and lose option settings) would fulfil
the user's expectation of the on switch and the off switch being found in
the same place. In a way it simplifies the interface to have features where
people most naturally look for them.

Now that I understand it, I've got no problem with it. I'm just pointing out
that for the next new user, unless the docs further explain this, the same
confusion could occur. 

Best,
Whit
