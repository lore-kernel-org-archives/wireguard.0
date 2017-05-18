Return-Path: manuel.schoelling@gmx.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ef968ed
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 16:35:13 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e53e6723
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 16:35:13 +0000 (UTC)
Received: from xps ([37.201.240.208]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MhQju-1dP5fN3myY-00MdXx for
 <wireguard@lists.zx2c4.com>; Thu, 18 May 2017 18:46:44 +0200
Message-ID: <1495126002.1834.2.camel@gmx.de>
Subject: Re: Text-based IPC for Userspace Implementations
From: Manuel =?ISO-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>
To: wireguard@lists.zx2c4.com
Date: Thu, 18 May 2017 18:46:42 +0200
In-Reply-To: <CAHmME9pQxx_-h=8a_YpRgGnidjOA8aJeT=Lz3v-RkB_17dP9jA@mail.gmail.com>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <87vap1gd2w.fsf@alrua-kau>
 <358B5193-8D9F-472F-8202-B81BAA022FDD@titanous.com>
 <1500fe21-c423-b34d-adf5-463b5d483cbf@higgsboson.tk>
 <CAHmME9p4wtwUG8_4KvjdLcNcE33=BTWTNmWWX_eMWkiE=Z3Grw@mail.gmail.com>
 <1495029845.13481.33.camel@gmx.de>
 <CAHmME9pQxx_-h=8a_YpRgGnidjOA8aJeT=Lz3v-RkB_17dP9jA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, 2017-05-17 at 16:08 +0200, Jason A. Donenfeld wrote:
> Hi Manuel,
>=20
> On Wed, May 17, 2017 at 4:04 PM, Manuel Sch=C3=B6lling
> <manuel.schoelling@gmx.de> wrote:
> > Great to hear that wireguard gets a nice IPC interface.
> > Do you already know when this is about to land in the wireguard
> > releases/repos?
>=20
> When Trevor wakes up today and publishes rev32b of Noise, I'm
> planning
> on releasing a snapshot of WireGuard seconds after. Currently 7am on
> the pacific coast...

I am a bit confused: I updated to 0.0.20170517 on Debian, but no
/run/wireguard/ or /var/run/wireguard/ exists.
Then I checked the source code and apparently only the wireguard-tools
support the new socket IPC interface but the kernel module does not.
Is that observation correct?

Thanks!

Manuel
