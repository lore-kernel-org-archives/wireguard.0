Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4108b3b
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 21:07:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f102d87
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 21:07:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bb923d1f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 21:07:33 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id f82so101497181wmf.1
 for <wireguard@lists.zx2c4.com>; Wed, 16 Nov 2016 13:10:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87shqr6sw1.fsf@alice.fifthhorseman.net>
References: <CAKXLc7fZYEejEu0FmATWX6_8aAPRUxkPL429UK-39TGsFF4aUA@mail.gmail.com>
 <CAHmME9ordFZD8ESpTr9BEsedocoFDWjBwkWf43ke4X-m-bvibQ@mail.gmail.com>
 <CAHmME9oDp1R87utxJaL6hHimDedC66RVr+Hj_DXp07wc-jRynQ@mail.gmail.com>
 <87shqr6sw1.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Nov 2016 22:10:23 +0100
Message-ID: <CAHmME9oPuqAaQe1VKjjoy_VBwBe70TiKW_NJPs46HpBZyKj2RA@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] RFE: A notion of VERSION (was: Debugging AllowedIps)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Nov 16, 2016 at 10:01 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> On Thu 2016-11-17 02:40:30 +0900, Jason A. Donenfeld wrote:
>> Trying again with no line breaks:
>>
> Please don't assume that the source code is built from a git repository.
> On debian, we build from the tarball, which is extracted from the git
> repo, and we have nothing for "git rev-parse" to draw from.

That's why my horrible one liner falls back on getting the version
from the parent directory... Not pretty.

>
> For the cost of one extra commit just before tagging, you could populate
> a version.txt file and this then becomes $(shell cat version.txt).

Yea most likely this is what will wind up happening...
