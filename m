Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC80C6FA86
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 10:35:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 1db238ac;
	Wed, 28 Sep 2022 10:21:08 +0000 (UTC)
Received: from smtp-gw.pt.net (smtp-gw.pt.net [206.210.194.15])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9766f025
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 12:04:12 +0000 (UTC)
X-ASG-Debug-ID: 1663848249-09411a10533927e0001-KOqj8r
Received: from mail.pt.net (mail.pt.net [206.210.194.11]) by smtp-gw.pt.net
 with ESMTP id RSoP7FeXzA20WBsY (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384
 bits=256 verify=NO); Thu, 22 Sep 2022 07:04:09 -0500 (CDT)
X-Barracuda-Envelope-From: lew@donzis.com
X-Barracuda-Effective-Source-IP: mail.pt.net[206.210.194.11]
X-Barracuda-Apparent-Source-IP: 206.210.194.11
Received: from localhost (localhost [IPv6:::1])
 by mail.pt.net (Postfix) with ESMTP id 8D68A141564E;
 Thu, 22 Sep 2022 07:04:09 -0500 (CDT)
Received: from mail.pt.net ([IPv6:::1])
 by localhost (mail.pt.net [IPv6:::1]) (amavisd-new, port 10032)
 with ESMTP id 4oKtYhVrcRBM; Thu, 22 Sep 2022 07:04:09 -0500 (CDT)
Received: from localhost (localhost [IPv6:::1])
 by mail.pt.net (Postfix) with ESMTP id 51F18141551F;
 Thu, 22 Sep 2022 07:04:09 -0500 (CDT)
X-Virus-Scanned: amavisd-new at pt.net
Received: from mail.pt.net ([IPv6:::1])
 by localhost (mail.pt.net [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id sPBTaQmy51FK; Thu, 22 Sep 2022 07:04:09 -0500 (CDT)
Received: from mail.pt.net (mail.pt.net [206.210.194.11])
 by mail.pt.net (Postfix) with ESMTP id 3ACC4141564A;
 Thu, 22 Sep 2022 07:04:09 -0500 (CDT)
Date: Thu, 22 Sep 2022 07:04:09 -0500 (CDT)
From: Lewis Donzis <lew@perftech.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Bruno <bandry@ut1.org>, wireguard@lists.zx2c4.com
Message-ID: <1980318156.4949115.1663848249035.JavaMail.zimbra@donzis.com>
In-Reply-To: <CAHmME9rd4g0EkPQqXX9vViHRuU8uaGkENNNa+TsBi3C_QNHbxw@mail.gmail.com>
References: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
 <CABBZOs=bkOWQv09UQJnf18xVGAq_o6O+Ar+asMKoXtghcQvnog@mail.gmail.com>
 <ee65e180-eef5-b882-58ab-8a1188a38a09@ut1.org>
 <CAHmME9rd4g0EkPQqXX9vViHRuU8uaGkENNNa+TsBi3C_QNHbxw@mail.gmail.com>
Subject: Re: MacOS app update needed
MIME-Version: 1.0
X-ASG-Orig-Subj: Re: MacOS app update needed
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Originating-IP: [206.210.194.11]
X-Mailer: Zimbra 8.8.15_GA_4372 (ZimbraWebClient - GC105 (Mac)/8.8.15_GA_4372)
Thread-Topic: MacOS app update needed
Thread-Index: yQcyCBO7Uq9l/QP2juSUhx7/h3o9lQ==
X-Barracuda-Connect: mail.pt.net[206.210.194.11]
X-Barracuda-Start-Time: 1663848249
X-Barracuda-Encrypted: TLS_AES_256_GCM_SHA384
X-Barracuda-URL: https://smtp-gw.pt.net:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at pt.net
X-Barracuda-Scan-Msg-Size: 1796
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.100960
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Mailman-Approved-At: Wed, 28 Sep 2022 10:20:52 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

----- On Sep 22, 2022, at 6:43 AM, Jason A. Donenfeld Jason@zx2c4.com wrote:
> On Wed, Sep 21, 2022 at 10:22 AM Bruno <bandry@ut1.org> wrote:
>>
>> Hi,
>>
>> Windows Client project don't feel alive either. Last commit has 6 months
>> and last release is 9 month old.
>>
>> Same, here https://git.zx2c4.com/wireguard-windows/log/ and here
>> https://github.com/WireGuard/wireguard-windows
>>
>> Version 0.5.3 works well, but I suppose it can be even better!
> 
> That seems pretty uncalled for. Folks asking for a wireguard-apple
> update have good reason to do so -- there are outstanding bugs and
> pull requests. But for wireguard-windows/wireguard-nt? C'mon now --
> that's received some *extremely* active development, stabilizing after
> nearly weekly updates for some time. Are there outstanding pull
> requests for it? So your note here really isn't appreciated. The
> WireGuard project doesn't churn out code and updates just for the sake
> of writing code and doing updates. Things need to have rationale.
> There will be updates to wireguard-windows/wireguard-nt at some point
> when development makes sense there. But right now? Is there something
> pending? Instead maybe be thankful that that software has reached a
> point of stability where project development energies can go into more
> pressing tasks, such as wireguard-apple.
> 
> Jason

I could not agree more.  What a world we live in where code that hasn't been touched for a few months is considered stale, rather than being rewarded and appreciated for reliability and stability.  Jason, congratulations on not needing to touch that code for six months!  Much of the beauty of Wireguard is its simplicity, to the point that it can be done "right", and it really shouldn't need to be touched!
