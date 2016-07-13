Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8667cf0
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 17:54:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f244baae
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 17:54:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cee9ca51
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jul 2016 17:54:28 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id h129so45083350lfh.1
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jul 2016 10:55:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160713175156.GA28141@lud.polynome.dn42>
References: <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
 <20160712155857.GA1368@lud.polynome.dn42>
 <87vb0asqa5.fsf@alice.fifthhorseman.net>
 <CAHmME9rvBu0XC=0_SsrR_vLMud1QJQtDmZzGyWoVHCmK5SFwqA@mail.gmail.com>
 <87bn22sj4t.fsf@alice.fifthhorseman.net>
 <526930c8-f538-ec13-c55a-18f6dbbecb91@mmoya.org>
 <CAHmME9qWycXjsGY02z=0RGB9GCAbFCPz_f+2UM-ZXwmFwsMV+w@mail.gmail.com>
 <20160713083633.4c3c07f9.alex_y_xu@yahoo.ca>
 <20160713165745.GB25457@lud.polynome.dn42>
 <8737ndo2t2.fsf@alice.fifthhorseman.net>
 <20160713175156.GA28141@lud.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jul 2016 19:55:22 +0200
Message-ID: <CAHmME9pXHmOe0bxD7zrdE4FWGZ0BAdm3nwcoc6Kw8GgCT+u8cg@mail.gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Troubleshooting with WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jul 13, 2016 at 7:51 PM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> will win.  If two peers have the exact same AllowedIPs entry, then I'm not
> sure what happens.

Fear not, WireGuard has no undefined behavior! The routing table
implementation does not allow for nodes to be duplicated like that.
Only one peer may be assigned to the same node (IP/CIDR). If you run
these commands:

# wg set wg0 peer ABCD allowed-ips 1.2.3.4/32
# wg set wg0 peer EFGH allowed-ips 1.2.3.4/32

Then afterward if you run:

# wg show wg0

You'll see that ABCD has an allowed-ips of "(none)" and EFGH has an
allowed-ips of "1.2.3.4/32". In other words, setting will "move" an
existing entry to the new peer.
