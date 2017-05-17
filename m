Return-Path: manuel.schoelling@gmx.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07386847
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:52:44 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f25cd572
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:52:44 +0000 (UTC)
Received: from schoellingm ([193.175.154.19]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MKpQ4-1dAzYc2rse-0008MX for
 <wireguard@lists.zx2c4.com>; Wed, 17 May 2017 16:04:06 +0200
Message-ID: <1495029845.13481.33.camel@gmx.de>
Subject: Re: Text-based IPC for Userspace Implementations
From: Manuel =?ISO-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>
To: wireguard@lists.zx2c4.com
Date: Wed, 17 May 2017 16:04:05 +0200
In-Reply-To: <CAHmME9p4wtwUG8_4KvjdLcNcE33=BTWTNmWWX_eMWkiE=Z3Grw@mail.gmail.com>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <87vap1gd2w.fsf@alrua-kau>
 <358B5193-8D9F-472F-8202-B81BAA022FDD@titanous.com>
 <1500fe21-c423-b34d-adf5-463b5d483cbf@higgsboson.tk>
 <CAHmME9p4wtwUG8_4KvjdLcNcE33=BTWTNmWWX_eMWkiE=Z3Grw@mail.gmail.com>
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

Hi Jason,

Great to hear that wireguard gets a nice IPC interface.
Do you already know when this is about to land in the wireguard
releases/repos?

Bye,

Manuel


On Wed, 2017-05-17 at 16:01 +0200, Jason A. Donenfeld wrote:
> On Tue, May 16, 2017 at 9:26 PM, J=C3=B6rg Thalheim <joerg@higgsboson.tk>
> wrote:
> > For the kernel, netlink will be used, which is already does its own
> > serialization format. The use of JSON here, would not make sense
> > here.
>=20
> Right. I'd indeed be very amused to see a JSON parser land in the
> Linux kernel.
>=20
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
