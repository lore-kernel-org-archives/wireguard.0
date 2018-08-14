Return-Path: dfawcus@employees.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91da9dbd
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Aug 2018 20:14:38 +0000 (UTC)
Received: from accordion.employees.org (accordion.employees.org
 [IPv6:2607:7c80:54:3::74])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26d91022
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Aug 2018 20:14:38 +0000 (UTC)
Date: Tue, 14 Aug 2018 21:26:30 +0100
From: Derek Fawcus <dfawcus+lists-wireguard@employees.org>
To: wireguard@lists.zx2c4.com
Subject: Re: Fragmentation on UDP layer possible?
Message-ID: <20180814202630.GB90034@accordion.employees.org>
References: <CA+7UkwLpoa_n87PKghohdGc5JVpYJdjAB1a8NUpYjx35o5nPWw@mail.gmail.com>
 <20180813000611.3296fa66@natsu>
 <20180814102949.GB9786@tuxmachine.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180814102949.GB9786@tuxmachine.localdomain>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

UDP may (eventually) get a native segmentation capability,
but the work is still under discussion, and possibly subject
to change.

  See the FRAG option within draft-ietf-tsvwg-udp-options
   (https://tools.ietf.org/html/draft-ietf-tsvwg-udp-options-05)

DF
