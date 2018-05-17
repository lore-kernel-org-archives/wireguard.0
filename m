Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f405e3c8
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 May 2018 05:03:04 +0000 (UTC)
Received: from rei.romanrm.net (rei.romanrm.net [172.104.66.239])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c17569f
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 May 2018 05:03:04 +0000 (UTC)
Date: Thu, 17 May 2018 10:03:25 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Paul <paul@makrotopia.org>
Subject: Re: Need for HW-clock independent timestamps
Message-ID: <20180517100325.1c542b1f@natsu>
In-Reply-To: <1526528456.18498.0@mail.makrotopia.org>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
 <20180515202126.yw57deh6st5ebnk6@kowloon>
 <CAKXLc7drht4CVexsCTXwHe-Z_RyFghAhQsXom=z9dtQuxQU48Q@mail.gmail.com>
 <20C72316-B8FC-4515-8DC8-8BC82BF3864F@cgws.de>
 <CAJQSx3at0rGtjPrpch2mcCqeTQCZVwaiG1kSHBW19Nk4McJxGQ@mail.gmail.com>
 <1526528456.18498.0@mail.makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, 17 May 2018 12:40:55 +0900
Paul <paul@makrotopia.org> wrote:

> For me it looks like a problem solvable in software (as done for the 
> BMX routing protocol). Why even bother to get hardware involved?

Personally I am puzzled this is even an issue in WG. Not a single other VPN
protocol mandates every node to keep a monotonically increasing counter,
including even over reboots.

This has never been an issue in Tinc and OpenVPN at least, and if I'm not
mistaken neither in IPsec. And now suddenly we have people saying everyone now
has to buy and solder in some satellite based hardware just to use a VPN.

Given this didn't even arise in other VPN solutions, surely there must be other
way to solve the "replay attack" issue, without requiring an RTC (or a
persistent counter)? Perhaps nobody has just thought long enough about finding
one, and given the project in the early stages, just using the RTC (which
"everyone has") was chosen as a quick placeholder for now?

-- 
With respect,
Roman
