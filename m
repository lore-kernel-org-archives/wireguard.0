Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0439d38
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 17:53:09 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fcfdffd1
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 17:53:09 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Manuel =?utf-8?Q?Sch=C3=B6lling?= <manuel.schoelling@gmx.de>,
 wireguard@lists.zx2c4.com
Subject: Re: Text-based IPC for Userspace Implementations
In-Reply-To: <1495126002.1834.2.camel@gmx.de>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <87vap1gd2w.fsf@alrua-kau>
 <358B5193-8D9F-472F-8202-B81BAA022FDD@titanous.com>
 <1500fe21-c423-b34d-adf5-463b5d483cbf@higgsboson.tk>
 <CAHmME9p4wtwUG8_4KvjdLcNcE33=BTWTNmWWX_eMWkiE=Z3Grw@mail.gmail.com>
 <1495029845.13481.33.camel@gmx.de>
 <CAHmME9pQxx_-h=8a_YpRgGnidjOA8aJeT=Lz3v-RkB_17dP9jA@mail.gmail.com>
 <1495126002.1834.2.camel@gmx.de>
Date: Thu, 18 May 2017 14:04:38 -0400
Message-ID: <878tlu9h3d.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu 2017-05-18 18:46:42 +0200, Manuel Schölling wrote:
> On Wed, 2017-05-17 at 16:08 +0200, Jason A. Donenfeld wrote:
>> Hi Manuel,
>> 
>> On Wed, May 17, 2017 at 4:04 PM, Manuel Schölling
>> <manuel.schoelling@gmx.de> wrote:
>> > Great to hear that wireguard gets a nice IPC interface.
>> > Do you already know when this is about to land in the wireguard
>> > releases/repos?
>> 
>> When Trevor wakes up today and publishes rev32b of Noise, I'm
>> planning
>> on releasing a snapshot of WireGuard seconds after. Currently 7am on
>> the pacific coast...
>
> I am a bit confused: I updated to 0.0.20170517 on Debian, but no
> /run/wireguard/ or /var/run/wireguard/ exists.
> Then I checked the source code and apparently only the wireguard-tools
> support the new socket IPC interface but the kernel module does not.
> Is that observation correct?

yes!  the subject line is "for Userspace Implementations" , so i think
they're not relevant for kernel implementations :)

      --dkg
