Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 97a5c1de
 for <wireguard@lists.zx2c4.com>; Sat, 9 Jul 2016 15:50:27 +0000 (UTC)
Date: Sat, 9 Jul 2016 10:49:47 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: wireguard@lists.zx2c4.com
Message-ID: <20160709154947.GA30670@wolff.to>
References: <CAHQn_MAD4WvhueAEVR255SarPnJtfvYjREA7MFdsaJrz97EEBw@mail.gmail.com>
 <CAHmME9pc0JgTgCTQ6FT5ChvB+0mv8nDLA57iis9c2FA7MPSV-g@mail.gmail.com>
 <CAHQn_MC1S4X_TYaGi2XtwWXZuu3erEWK6fXvB-ja9GFnJfR5RQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHQn_MC1S4X_TYaGi2XtwWXZuu3erEWK6fXvB-ja9GFnJfR5RQ@mail.gmail.com>
Subject: Re: [WireGuard] Options to obfuscate WireGuard traffic?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jul 08, 2016 at 21:13:02 +0200,
  Bin Jin <bjin@ctrl-d.org> wrote:
>> Actually there's already a PSK mode. I suppose it's possible to
>> leverage this to add an obfuscation layer. This is likely the most
>> robust way of doing things, in fact. I'll give this some more thought,
>> but it's kind of unlikely that I'll incorporate this into the
>> codebase.
>
>I see. It's a bit pity to learn that, but I understand it's kind of
>ugly and probably still not enough (due to fixed packet length for
>first two types). Thanks for explaining every details.

I'm not sure it makes sense to combine the hiding of traffic with the 
secure tunneling of traffic. There are going to be different efficiency 
trades and there are going to be different traffic patterns available 
to try to blend into. So different people are going to want to use 
significantly different solutions to that problem. Given the design goals 
of wireguard, I don't think it is something that would be particularly 
good to combine with steganography.

I think for normal people this is more of a political problem then a 
technical problem. We need real net neutrality, with ISPs not allowed 
to block traffic based on content. (e.g being prohibited from charging 
people extra to allow the use of VPNs.) We need governments not passing 
laws to make people compromise their own security (e.g. RIP in the UK), 
nor should they prevent companies from providing applications or services 
where the end user can guaranty their security (as some people are trying 
to do in the US). Using strong unbreakable encryption when communicating, 
should be the norm, not something you need to hide.
