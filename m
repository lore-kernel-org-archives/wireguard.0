Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f16d1362
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 May 2018 05:53:56 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61dd2b6a
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 May 2018 05:53:56 +0000 (UTC)
Subject: Re: Need for HW-clock independent timestamps
To: wireguard@lists.zx2c4.com
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
 <20180515202126.yw57deh6st5ebnk6@kowloon>
 <CAKXLc7drht4CVexsCTXwHe-Z_RyFghAhQsXom=z9dtQuxQU48Q@mail.gmail.com>
 <20C72316-B8FC-4515-8DC8-8BC82BF3864F@cgws.de>
 <CAJQSx3at0rGtjPrpch2mcCqeTQCZVwaiG1kSHBW19Nk4McJxGQ@mail.gmail.com>
 <1526528456.18498.0@mail.makrotopia.org> <20180517100325.1c542b1f@natsu>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <748e7dbf-0238-6c81-ab18-83d6174405fe@urlichs.de>
Date: Thu, 17 May 2018 07:53:17 +0200
MIME-Version: 1.0
In-Reply-To: <20180517100325.1c542b1f@natsu>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 17.05.2018 07:03, Roman Mamedov wrote:
> Personally I am puzzled this is even an issue in WG. Not a single other VPN
> protocol mandates every node to keep a monotonically increasing counter,
> including even over reboots.

Wireguard's connection setup is a whole lot simpler than most other
protocols. It basically doesn't require a "real" handshake, just a
request/reply pair. Thus it's vulnerable against disruption by replay
attacks – a replayed rekey packet would disrupt conversation until the
real sender times out, a minute later.

-- 
-- Matthias Urlichs
