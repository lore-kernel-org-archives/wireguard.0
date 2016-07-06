Return-Path: bruno@wolff.to
Date: Wed, 6 Jul 2016 10:19:11 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160706151911.GA11926@wolff.to>
References: <20160706120410.GA765@wolff.to>
 <CAHmME9qs42O4KQtsuZDdPGPKEkyxGhHEGxB3crkrgrAaLDKh3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9qs42O4KQtsuZDdPGPKEkyxGhHEGxB3crkrgrAaLDKh3w@mail.gmail.com>
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
Subject: Re: [WireGuard] Comments on wgserver.service
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jul 06, 2016 at 16:33:02 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
>Thanks for your feedback on this. That's a good idea to call ip-link
>del first. I get that the - will make the error non-fatal, but will it
>also suppress writing the error message into journald?

I don't think so. I see 'Cannot find device "wg0"' that looks like it 
comes from that command. It doesn't show up in systemctl status output 
though.

>Please feel free to make wgserver.service into a more robust unit file
>and send patches (git-send-email), or make a few different unit files
>show casing different types of configurations. I'm not a huge systemd
>guy, so I just sort of threw that together haphazardly. It'd be nice
>also to see this integrated into systemd-networkd and the .network
>units. Are you involved with upstream at all? Interested in taking
>this integration work on?

After I hear back about the systemd bug, I'll submit a simple change 
for robustness.

Some of the other stuff seems situational and I'm not sure makes for 
great examples. If I figure out a standard way to make sure dns is 
available, I'll include something for that, since that would be 
reasonable to do by default. But that is beyond my current systemd 
knowledge.

I don't know systemd well at all. Based on your example and some reading, 
I know significantly more today than I did yesterday morning. I do some 
stuff for Fedora and once in a while I'll do a bisect to try to narrow 
down a problem I'm having with a kernel on my hardware. I'm not a kernel 
developer at all.

Wireguard caught my eye because of the timing. I was looking at trying to 
set up an ipsec tunnel in preperation for having my work desktop switching 
to a non-routable IP address. Working with wireguard looked easier than 
trying to figure out ipsec, even with having to build wireguard from source. 
Potentially I could get involved with packing wg on Fedora, but there isn't 
much point until the kernel part is upstream.
