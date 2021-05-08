Return-Path: <SRS0=Lifx=KD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1836FC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 May 2021 16:35:01 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29F716140F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 May 2021 16:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29F716140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f886a5d7;
	Sat, 8 May 2021 16:32:02 +0000 (UTC)
Received: from sonic303-20.consmr.mail.ir2.yahoo.com
 (sonic303-20.consmr.mail.ir2.yahoo.com [77.238.178.201])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3fc7941d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 May 2021 16:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1620491520; bh=q0oacci47KM27uqzW0gLN+cSIroKSTLpsUY1Whds3Oo=;
 h=To:From:Subject:Date:References:From:Subject:Reply-To;
 b=SXK7NchhKxXI/zw+HAR+UbkPJNKHP1Z4x2DuF0dF06bgToln/oNYfXmJd6W7uZR11OBFnrxiKjsyeZohVtumdPma+aKLiyTqoJtaB67BC6KzYoNV5ZpogDetPVJlfRJA5xOm86Sw9dPk5k9w0TIJHv98MN2otx6Hc4veNQHkgX76yu/YILacF2IlvjOGajtBw2evfO6zMv227moH73XOGIpo1RV71TwJbN4HRRkN6l6Gq+GRGGRIw433btj7aUuPyhMU391tkFVKL6aY8AvIs8kvtOzTkHPzab2mC0WRV3NVzDJ+htJkuOu4b/Ke+7hLsi0VhrqlSt9XtWLh5Bhbag==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1620491520; bh=Nec05lsXj4RGOHiXNa2EM+AImz9Ny9/qepc5Mkfv2eb=;
 h=X-Sonic-MF:To:From:Subject:Date:From:Subject;
 b=jkC82jwZ80sgDxxk7s3pMb+q0l8k3ZjdmkiZSu4vCwbnTC935vzEKSRvRnj9hE+m1AqjL1pWqb+glkTuSvbVXm+kgdoqEbLTyP+nRz0bJL3GsDH9moh4cXh79QXP+NcSQqKGHEVIOjih15B3XRlGLA5fsNTymyod4XaUQ62AZiIKolM+1If4Fa8pgMel6+N6lgV0XqJIv756JeA6bSMn0VLZYXYX1qhFbUOCINjby0TX3Uxx3LyWLxlnZMBDl92VZycy1MO6xn9rPA1D6/sf+Jq+tUUyeCUBGilOfiObKSICeUN8t1iZv2mz/a/m8ES9KknY6WPui3AFn5ijY/gluA==
X-YMail-OSG: 0ihY69gVM1nDbeI7JJqyOsR9UgJjZeZjEMXmIA0NkCYdgzhqH4U0rWSaYQyx8pF
 MPjbB0wWjssPfQTb3UCrknCibVikXLO6Q14SX.GcXJRdQcEFDg.nsYzRjsGhgX7ffRVFBCZ1PYqF
 XboQeYz0RG5wPKXbsedGueobSJOTfoJsjsSBI_evLaoYl5zvMikZUz5fNXOdmvp7PvPCKBBanl66
 73gPFIJBcgcB4wOsh2hnO5JGpw_x0OMrsfmI9cm_vCpapkVJEYsFGkMAuarign3EW6mYMCofjH.J
 OrwgGfMEtx7GRr0JXFqNLIXbyel9TTAPk6L164cW1QvpeVhLNgriAg1vO1cCyVznrjOzukQFavtm
 c8LC6LaTBxh8eTJqV63dk9AcK5nAQ08J3c0zUGrVLAAXxel2colNdOOWaOsqdWwI_DieRnNCzElC
 KBVPYzvGjxt9lL0QedRNAEVexUTLk9XrTOwigCw_.nM3NAxEeDHQFVR6e4Zrb_adSCkk.uP6rnzW
 7nuvbnEBh6VGho5_DxG7jpcE0R9PPka103F2bwALyknIEUgEa4ikS_sNYxFl.eFLjZTHY7MI565n
 GtmZ9GlZbjyZoQIqWhdG9RQvZI38gLiHBDVMvHWmwFFCBkmQ6HwQDvQR0gr7L6V0_0ocjutQ3Utt
 hfoJ2H.EmJTC_1hO6tyIv.oaL5.q65B9EXI404anfwgjlqDvPtg9fR3AW464oLPdA8BfqkVPxBUc
 R9gWfouhCLWVMw.W7SLCl3pjOjiruuXyvBvkPmg7wY7FxEqgRg90SVTvc0xQS2rkM9Zd92tcPnGd
 eFjCI5bPnnNUG1fDD9rY5lKbspDP4xHUOOhLESAtq.i.R6bPfKvseyxqHYHuJwrTwrfus74Hg8dX
 C43nTnU0pRO7apY2XuYaECBqOrm31FDCSP4vpSlOhq3FtWfcFycTOUSMZ9Qb7Fq_bbVHRp32sQK6
 xlimx9G0I1Hc4uoShoUON8KVNvf1Nv9hE3BPVewsCxN0GTi45ct_K0BOyyT2KtqSchQIbZDySlsT
 TTtTKS4z7fyT_xGsf_2cmh6AcRVuuKlDZZS7FcT.FA_C0kcV7D8XRvqE1AilfLEd87IhK68Q7jK0
 yCbxU.RgAfp_5JZnmdXmNhs1.zJxgWgC8Mc2IW3Ix7GtKHK.rW9EUG_nlttAep5SAg8n1vyWS14B
 9I9rK9UuIbhubk9gFgps4Px5eD4IDjCZP.NsztyC3GYptwFEIsR1ivuaqjOzmeW5E2Hof4ObxI2Q
 oBt5.9U1wBaQnU83oDQty2NJxq.AGUN4TPiBibA0Y1GFVdHNv20WTW1d3Yv09_IkZw1x92X4aOnV
 RsKsZ_AL0nKPJIYj61gfv1cWTZpYNtANBc8umj2O8MecXOIVvKYh8yDvAJzvIvI_tDMoDoNDsC4k
 kOY4kzM.h476td08FiF1LIZ7y.pBm7q2ZbKa5or8w7ao5idE0koXxLR0h5fnTaRk6i7.nNGF9H1D
 KMzoRZ51dumuHHkdYJCVYWLlirxBALVhclJws9_B6vzoEAi5gg6wwIY7WDZwBVHO1kqBa9gwra.b
 h5U6ybhDgtPDmk7LsxA_cLcx884NUlJYeX6Uu.6nzPDQIBf3JQyVoxpWQkFvMTLFAsASnPRa.YsS
 NLoyn_.3BeEzEYURuxixWs6yGVKyy3Kg2MwCVW4BqlMKnxIVfGfre_HRQ6GWGX0_E5QjACe.WGLI
 c09aM08h4lp1sg2hB.kXFZ3z.NP4jxb20wEFJsgLD7VrH8Ai.Av4KXCNJ9wt3aWJ077ywGO7Y0ZS
 5G_INMiI7eEn350RRrHfcgBWxDxSxilEtp9S4rPw2715sYcSdlv1BAwTHC2zCE9uYS8P0mznVB2j
 CV0tKFqPskQKE6Iaqa8j8OOtcWWiLdbtGre07ANkAcmI.l7Kkg_QeIH1wn.jHGi9K5RX.pULLDd4
 1Wl8T0SSljwdpWOu7Gt9HhGS.WwK2Da1p7c579hZjY1eSreHYBdXEPrTsuV.iUI6CFJkITVU4o02
 CqjDkjNq.lY3QEnd1MjrVmWkjxgnSiOyWgIP1pOsS01CIru5nDnlEWsr0vXJa_5QyYJ1NQrswK8_
 g4rMtgKfkGzcEtu27iV4esZxslqUL0n7xVqDQ0uWeS3ivqmp4LZAANaqNJwoOXJB.fCTyJywU8OA
 Ls5dpTrIf12GOxVKoPa.wwDv1aDeNiBcWCOsRIaPgP9qei6xDUjoo6xuRgUj6CPIacrac6.UoAKT
 w_clRQz8SNmBZ..s7CwZcc4BTR0eCnWD2_lmKdARZaxdFLgJmRFSUARlhfpsmDQnKBVMA8ZfGZpL
 ExDSqlF.TNtdTIk00krYkm8tJWNxsZ47BCa5Yi0ZIVhJA5nUhT_DI9wHcAUZPDrcauet4Ns0_p0c
 z4iDR5i2n3xu4QZHgPIQnxEsZwnh1h2L3hrcakSfvyHriDtVhRYqDQqkR1QF5
X-Sonic-MF: <peljasz@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.ir2.yahoo.com with HTTP; Sat, 8 May 2021 16:32:00 +0000
Received: by kubenode517.mail-prod1.omega.ir2.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 7fb9a5e98d8ade9157fad9b2e46683f3; 
 Sat, 08 May 2021 16:32:00 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: lejeczek <peljasz@yahoo.co.uk>
Subject: secondary IP on wg0 fails
Message-ID: <204f6e7b-d594-c2c0-5242-1643055065c3@yahoo.co.uk>
Date: Sat, 8 May 2021 17:31:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
References: <204f6e7b-d594-c2c0-5242-1643055065c3.ref@yahoo.co.uk>
X-Mailer: WebService/1.1.18231
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
 Apache-HttpAsyncClient/4.1.4 (Java/16)
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

Hi guys.

I'm experiencing a pretty weird wireguard, or perhaps 
kernel/OS stack bits behavior.

I have three nodes which all can ping each other on wg0's 
IPs but when I add a secondary IP:

-> $ ip addr add 10.0.0.226/24 dev wg0

it gets weird, namely, say when that sec IP is on
A -> B ping returns; C ping waits, no errors, no return
B -> both C & A pings return
C -> neither A nor B ping returns

I'm on CentOS with 4.18.0-301.1.el8.x86_64.
All three nodes are virtually identical kvm VMs.

any suggestions as to what is not working here or how to 
troubleshoot are vey appreciated.
many thanks, L.




