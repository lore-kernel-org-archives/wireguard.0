Return-Path: <SRS0=erT1=NE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FB6C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Aug 2021 15:58:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1380A60FC4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Aug 2021 15:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1380A60FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=friedels.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 180498f0;
	Fri, 13 Aug 2021 15:58:42 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 48919c95
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Aug 2021 15:58:38 +0000 (UTC)
Received: from [192.168.177.174] ([91.56.79.231]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MCGag-1mMr2F3Hve-009Qbo; Fri, 13 Aug 2021 17:58:38 +0200
From: "Hendrik Friedel" <hendrik@friedels.name>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, "WireGuard mailing list"
 <wireguard@lists.zx2c4.com>
Subject: Re[2]: [ANNOUNCE] WireGuardNT,
 a high-performance WireGuard implementation for the Windows kernel
Date: Fri, 13 Aug 2021 15:58:18 +0000
Message-Id: <emf58fb568-663d-469b-aa45-48fbf11e46b4@envy>
In-Reply-To: <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
References: <YQgrCfqIL2SWfF6G@zx2c4.com>
 <CAHmME9p8WLAzd=W+Z6MKtke5PYb_T6iMbvBFirmCeUQzxycRwQ@mail.gmail.com>
User-Agent: eM_Client/8.1.1060.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IfmsteGRxOKgyDyRGtdKxpsP9QwJyHHRiEfgojTa4kgPbk4pYvz
 66s5/1CLRPtS5jsEKA6wUXc6zC7/yfM/bDYOhfCHRFX4G7/ZDyCbZNPCFTDRwTZ1pslsU0x
 Fq+hT4jkBm+IpKPae27Gqu7MJ4tgWyaTBhqhWoNNZCHyTKwZu5ovzSeGYSzvUvaa8r9JzBP
 e8lSmKdy55TNcHJayNqNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:14NA6SZvnF4=:fEZvpo9Spi+qmATsT1K2t5
 3pDgsvi51MDcJk8sKjXLySKYyO0X2zKIa/KkyoVNFpIfxfaO08BpX8Z1YjMX4GQjve374Kcoa
 P27UQZU0xNgBLOmFY/vNpvBnOHghpmBMO3N6V9exNG/xIVBnDjHR8+/itW+1ahT+KysE6vz2X
 R9S4YiwPmHeprGeLbCWSJfq8Rqw76cr2i6UbnzG0c/pNyqKpLziZJUonCEiMlv+GTvHb5Z3Ie
 HLbHT6DG/2H23BOdwnFq3oyu9O7nwa25NnBdYaawu1rJL/lNam9lbq6hLjgTShp9+ScwNKQo2
 Mrcl7D66WmI3uJN/fCOE4No8TrryMo2UPcwcb9yFKjkoIUS2vD/RdHT0fksIdnV+31iMMSSvr
 UzR0yMg5cXmWw2leF2D4ExnyKfqkdmdsR7MYxhq8I/ytSfL/lKLDAeGJF2yIZqXyvkezuCqGY
 aGCVOrKJVRKJkoZaRjJl0UxBBNOCKeO5BOKRO+JLAz+Ikn9Hma4SYRHd/dltrdRozKAQq9/Om
 nwkrCh5Pn01oWLA3G994ZLnLuJQq2UbWhEGpnJ3OdFW7IDd8mRwIv4aA1n3el/dn4a3V0/m1L
 Ha5Je6XqR6IuOaPUbcFVE7hsCy3eGGvkoWiSVygb1G7RJP34DlJXYhnXqwWtMiVbHLtF0iA4r
 A2kYDZLpDRZq8Q0f+YHldXBgcJB/CPhmuH53GIKAwUBCRm2ts6Kz7qgv2anr5PDyr9dWtPS5i
 /rrOhfV1kk1lP267YBGa7HhUmOK9FdRlnrj3AomdzBM9iVWINCAWycrZwnthUVIR3EGRtIMdF
 xWhFVNciFgBys0zi6KuzRpySJv9bp4g7gpYPhYSePwORF2+bS24ITFnF0G1KjC6AWqZfkmo
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
Reply-To: Hendrik Friedel <hendrik@friedels.name>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello Jason,

thanks for your work on Wireguard.
I have just updated and activated the experimental driver. The fact that=20
I do not need to activate it in the registry was decisive for me ;-)

I cannot report any issue so far.

Best regards,
Hendrik

------ Originalnachricht ------
Von: "Jason A. Donenfeld" <Jason@zx2c4.com>
An: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Gesendet: 13.08.2021 13:52:39
Betreff: Re: [ANNOUNCE] WireGuardNT, a high-performance WireGuard=20
implementation for the Windows kernel

>Hi everyone,
>
>On Mon, Aug 2, 2021 at 7:28 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>  Nonetheless, experimental or not, we still need people to test this and =
help
>>  shake out issues. To that end, WireGuardNT is now available in the ordi=
nary
>>  WireGuard for Windows client -- https://www.wireguard.com/install/ -- w=
ith the
>>  0.4.z series, in addition to having full support of the venerable wg(8)
>>  utility, but currently (August 2021; if you're reading this in the futu=
re this
>>  might not apply) it is behind a manually set registry knob. There will=
 be
>>  three phases of the 0.4.z series:
>>
>>    Phase 1) WireGuardNT is hidden behind the "ExperimentalKernelDriver"
>>             registry knob. If you don't manually tinker around to enable =
it,
>>             the client will continue to use wireguard-go/Wintun like bef=
ore.
>
>After the first few days, bug reports for WireGuardNT have died down
>considerably. It's hard to tell whether that's a sign that the
>software is stable or that nobody is using it. So, we're still in
>phase 1. However, with version 0.4.5 of the client, I've added a
>checkbox below the "activate" button in order to make the experimental
>testing more discoverable. I dislike such knobs, but I'd rather have
>more testing than less, before turning it on by default. Hopefully
>this will make it easier for alpha testers to give it a spin and
>report findings. If you have been testing the driver, and it's been
>working well for you, please write in to say so, simply as a signal
>that it is being tested. If things stay as quiet as they are now on
>the bug reporting front, we'll likely move into phase 2 -- enabling
>WireGuardNT by default, with a registry key to revert to the legacy
>implementation -- in 2 to 3 weeks.
>
>Jason

