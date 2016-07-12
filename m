Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2af7afec
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 17:55:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e64b127
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 17:55:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 94415cf9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 17:55:03 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id b199so20423398lfe.0
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jul 2016 10:55:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87vb0asqa5.fsf@alice.fifthhorseman.net>
References: <CAMRLKH8cAu+sD0Pss=GGVbqGUiZxvE3HT1sVgTsRFyKiQGpOog@mail.gmail.com>
 <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
 <CAMRLKH_Ve7cnhYP9ZtBT868m298fhxKYvRAEHhkdCVfmpVZbSQ@mail.gmail.com>
 <CAHmME9qw1Ymrjyfhkmh7YOBgBuKGP5r=VdurAR1KLpaoFzqCyQ@mail.gmail.com>
 <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
 <20160712155857.GA1368@lud.polynome.dn42>
 <87vb0asqa5.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 12 Jul 2016 19:55:50 +0200
Message-ID: <CAHmME9rvBu0XC=0_SsrR_vLMud1QJQtDmZzGyWoVHCmK5SFwqA@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

On Tue, Jul 12, 2016 at 7:46 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> While we're still in the experimental stages is a good time to propose
> improvements in naming.  Is there a better name to give either Endpoint
> or AllowedIPs (or both)?

Endpoint is a good name.
AllowedIPs is a horrible name. But I'm not sure what else to call it.
I'm open to all suggestions.
