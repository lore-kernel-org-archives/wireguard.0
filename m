Return-Path: neumann@cgws.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb5dc27c
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 May 2018 07:07:43 +0000 (UTC)
Received: from mail.dabax.net (mail.dabax.net [88.99.12.75])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b9ebaf4
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 May 2018 07:07:43 +0000 (UTC)
Date: Thu, 17 May 2018 09:07:57 +0200
In-Reply-To: <748e7dbf-0238-6c81-ab18-83d6174405fe@urlichs.de>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
 <20180515202126.yw57deh6st5ebnk6@kowloon>
 <CAKXLc7drht4CVexsCTXwHe-Z_RyFghAhQsXom=z9dtQuxQU48Q@mail.gmail.com>
 <20C72316-B8FC-4515-8DC8-8BC82BF3864F@cgws.de>
 <CAJQSx3at0rGtjPrpch2mcCqeTQCZVwaiG1kSHBW19Nk4McJxGQ@mail.gmail.com>
 <1526528456.18498.0@mail.makrotopia.org> <20180517100325.1c542b1f@natsu>
 <748e7dbf-0238-6c81-ab18-83d6174405fe@urlichs.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: Re: Need for HW-clock independent timestamps
To: wireguard@lists.zx2c4.com,Matthias Urlichs <matthias@urlichs.de>
From: Axel Neumann <neumann@cgws.de>
Message-ID: <AA544EA9-A23B-4F49-A468-617F5DF2B035@cgws.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>



Am 17=2E Mai 2018 07:53:17 MESZ schrieb Matthias Urlichs <matthias@urlichs=
=2Ede>:
>On 17=2E05=2E2018 07:03, Roman Mamedov wrote:
>> Personally I am puzzled this is even an issue in WG=2E Not a single
>other VPN
>> protocol mandates every node to keep a monotonically increasing
>counter,
>> including even over reboots=2E
>
>Wireguard's connection setup is a whole lot simpler than most other

But only if you ignore the implications coming with NTP transmissions=2E
its like Outsourcing some state transfer to another service and then claim=
 that remaining procedures are most simple=2E=20
/axel

>protocols=2E It basically doesn't require a "real" handshake, just a
>request/reply pair=2E Thus it's vulnerable against disruption by replay
>attacks =E2=80=93 a replayed rekey packet would disrupt conversation unti=
l the
>real sender times out, a minute later=2E
>
>--=20
>-- Matthias Urlichs
>
>_______________________________________________
>WireGuard mailing list
>WireGuard@lists=2Ezx2c4=2Ecom
>https://lists=2Ezx2c4=2Ecom/mailman/listinfo/wireguard

--=20
Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesendet=
=2E
