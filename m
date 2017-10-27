Return-Path: joe@solidadmin.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48a92db3
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 15:36:27 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2406a399
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 15:36:27 +0000 (UTC)
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
 <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
From: Joe Doss <joe@solidadmin.com>
Message-ID: <92b6b9c5-b07c-52fa-a72a-0fc2dcc253bc@solidadmin.com>
Date: Fri, 27 Oct 2017 10:38:17 -0500
MIME-Version: 1.0
In-Reply-To: <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 10/27/2017 09:51 AM, Jason A. Donenfeld wrote:
> So on one hand, you're fine with me shipping the hatchet, but you
> aren't [yet?] okay with the RPM-itself shipping the hatchet, because
> you'd like to find a more proper solution. This indicates to me that I
> shouldn't ship the hatchet myself then.
> 
> You wrote, "WG users at this point are going to accept their fate that
> not all features are going to work correctly." Actually, no. Firstly,
> I'm not up for shipping broken software, and it's not okay with me to
> have distros ship things broken, because they think that's somehow
> fine and users will put up with it. Secondly, I've received enormous
> quantities of hate email from Fedora users, which is what's prompted
> this whole thread in the first place. So, no -- for the next snapshot
> packaging, I'd like for there to be a solution to make things work. If
> you can solve the physical challenge, great. If not, hatchet?

Don't let small amount of WG users that are rude and ignorant push the 
project around. It's not the project's fault that they don't understand 
how to install resolvconf or manage their own DNS if wg-quick doesn't 
work. This isn't me saying that we shouldn't make it better. We should 
and we will. It is just going to take time.

If you feel this is super important and you want to ship a hacky 
solution to fix then do it. It's your project. That's why I said I was 
fine with it. It's a temp solution for a problem that needs a lot more 
packaging and dev time to fix correctly for every distro.

WireGuard is not 1.0 software. You say that on every snapshot release. 
If users can't read that and understand that not all features of the 
software are going to be where they need to be, then they shouldn't be 
using it. This isn't me saying you need to accept or be OK with shipping 
broken software. This is just a pain point for some users, so lets 
invest the time to figure out what the best solution is and make it 
happen. When I use WireGuard I never use wg-quick that's probably why I 
never even noticed it was broken on my Fedora workstations. I set WG up 
manually with my own scripts and I manage my own DNS because I don't 
have a fancy NetworkManager drop down in GNOME to do it for me... at 
least not yet. ;)

With that all said, I don't think the hatchet solution is great. It's 
going to cause more confusion that it is worth long term, but if you 
feel you need to have this issue fixed because users are super 
frustrated then do it for now and we can fix it later with the right way 
to do things in Fedora.

Joe





--
Joe Doss
joe@solidadmin.com
