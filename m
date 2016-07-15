Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cfdfbcbc
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 11:54:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 862fa195
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 11:54:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 97a2ed17
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 11:54:18 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id q132so86530193lfe.3
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jul 2016 04:55:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e17d88d3-9069-4894-6ebf-860719d14ca2@mmoya.org>
References: <CAMRLKH8cAu+sD0Pss=GGVbqGUiZxvE3HT1sVgTsRFyKiQGpOog@mail.gmail.com>
 <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
 <CAMRLKH_Ve7cnhYP9ZtBT868m298fhxKYvRAEHhkdCVfmpVZbSQ@mail.gmail.com>
 <CAHmME9qw1Ymrjyfhkmh7YOBgBuKGP5r=VdurAR1KLpaoFzqCyQ@mail.gmail.com>
 <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
 <20160712155857.GA1368@lud.polynome.dn42>
 <87vb0asqa5.fsf@alice.fifthhorseman.net>
 <CAHmME9rvBu0XC=0_SsrR_vLMud1QJQtDmZzGyWoVHCmK5SFwqA@mail.gmail.com>
 <87bn22sj4t.fsf@alice.fifthhorseman.net>
 <526930c8-f538-ec13-c55a-18f6dbbecb91@mmoya.org>
 <CAHmME9qWycXjsGY02z=0RGB9GCAbFCPz_f+2UM-ZXwmFwsMV+w@mail.gmail.com>
 <e17d88d3-9069-4894-6ebf-860719d14ca2@mmoya.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 15 Jul 2016 13:55:26 +0200
Message-ID: <CAHmME9oXDfwKtiQhE10TrjD6Tv6tgQgx7ax2p8o_+YKkEEd7yw@mail.gmail.com>
To: Maykel Moya <mmoya@mmoya.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: Re: [WireGuard] Troubleshooting with WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Jul 14, 2016 at 5:08 PM, Maykel Moya <mmoya@mmoya.org> wrote:
> On 13/07/16 10:28, Jason A. Donenfeld wrote:
>
>> TunnelIPs ?
>
> Consider 'TunnelIPs' (suggesting something *related to* the tunnel
> itself) vs. 'TunnelledIPs' (suggesting something *going through* the
> tunnel).

Good point. That's a subtle distinction. I didn't see it quite that way though

TunnelIPs -- IPs that are part of the tunnel, thus, in the tunnel
TunneledIPs -- IPs that are tunneled

So I think it amounts to the same thing....


>
> Happy bikeshedding!

Being a Gentoo dev, theoretically I'm supposed to really thrive during
bike shedding opportunities... blurg.
