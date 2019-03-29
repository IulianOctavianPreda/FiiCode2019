import { OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { SpeechService } from 'ngx-speech';
import { ApiService } from '../../shared/api/api.service';
import { SnakeService } from '../../shared/easterEgg/snake.service';
import { FloatingMicrophoneService } from '../../shared/services/floating-microphone.service';
export declare class MultimediaAlbumComponent implements OnInit, OnDestroy {
    api: ApiService;
    speech: SpeechService;
    snake: SnakeService;
    router: Router;
    private route;
    private floatingMicrophone;
    collectionId: any;
    gridSize: any;
    gridSizeSuggestions: any;
    skip: any;
    take: any;
    albumUrl: any;
    suggestedEntityUrl: any;
    deleteEntityUrl: any;
    addEntitiesUrl: any;
    getEntityUrl: any;
    bootstrapAccentPrimary: any;
    bootstrapAccentSecondary: any;
    slideShow: any;
    lockSlideShow: any;
    slideShowTimeBeforeNext: any;
    _albumData: any;
    _searchText: any;
    _mostUsedKeywords: any;
    _loadedFirstTime: boolean;
    _noMoreData: boolean;
    _deleteAccent: any;
    _markedForDeletion: any;
    _modalDeleteConfirmation: string;
    _scrollAmount: any;
    _suggestedEntities: any;
    _loadedEntity: any;
    _showEntityModal: any;
    _slideIndex: number;
    _showSuggestedEntityModal: number;
    _suggestedSlideIndex: number;
    private _destroyed;
    constructor(api: ApiService, speech: SpeechService, snake: SnakeService, router: Router, route: ActivatedRoute, floatingMicrophone: FloatingMicrophoneService);
    ngOnInit(): void;
    ngOnDestroy(): void;
    speechActions(): void;
    toggleMic(): void;
    getAlbum(): void;
    mostUsedKeywords(str: any): string;
    getSuggestedEntities(): void;
    onWindowScroll(): void;
    accessOrDelete(placeholder: any, i: any): void;
    noEntityModal(event: any): void;
    accessSuggested(i: any): void;
    noSuggestedEntityModal(event: any): void;
    deleteEntity(): void;
    loadEntitiesUntilScrollbarAppears(): void;
    loadMore(event: any): void;
    addNewData(event: any): void;
    _upload: boolean;
    upload(): void;
    _cancel: boolean;
    cancel(): void;
    discardedData(event: any): void;
    toggleDeleteButton(): void;
    loadInputOptions(): void;
}
